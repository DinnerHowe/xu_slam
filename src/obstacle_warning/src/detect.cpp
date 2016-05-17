#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/LaserScan.h>
#include <std_msgs/String.h>
#include <time.h> 
#include <iostream>
#include <ros/console.h>

using namespace std;

std_msgs::String flag;
float max_dis = 0.5;
string pre_data  = "ahead";


void laserScanCallback(const sensor_msgs::LaserScan::ConstPtr& laserScanData)
{
    // Example of using some of the non-range data-types
    float rangeDataNum =  1 + (laserScanData->angle_max - laserScanData->angle_min) / (laserScanData->angle_increment);

    // Go through the laser data
    bool flag_bool =false;
    for(int j = 0; j < rangeDataNum; ++j)
    {
         
        if( laserScanData->ranges[j] < max_dis )
        {
            flag_bool =true;
            break;
            
        }
        
    }

    if(flag_bool)
    {
        if (pre_data == "ahead")
        {
            flag.data = "stop";
            pre_data = "stop";
            time_t nowtime = time(NULL);
            cout << nowtime << "    stop!"  <<endl;
        }
    }
    else
    {
        if (pre_data == "stop")
        {
            flag.data = "ahead";
            pre_data  = "ahead";
            time_t nowtime = time(NULL);
            cout << nowtime << "    ahead!"  <<endl;
        }
    }

}

int main (int argc, char **argv)
{
    // command line ROS arguments
    ros::init(argc, argv, "pioneer_laser_node");

    // ROS comms access point
    ros::NodeHandle my_handle;

    // topic to public stop_flag
    string stop_flag_topic = "/stop_flag";
    if(my_handle.hasParam("stop_flag_topic"))
        my_handle.getParam("stop_flag_topic",stop_flag_topic);
    else
        my_handle.setParam("stop_flag_topic", stop_flag_topic);

    // topic to get scan data
    string detect_sub_topic = "/scan";
    if(my_handle.hasParam("detect_sub_topic"))
        my_handle.getParam("detect_sub_topic",detect_sub_topic);
    else
        my_handle.setParam("detect_sub_topic", detect_sub_topic);


    ros::Publisher pub_object = my_handle.advertise<std_msgs::String>(stop_flag_topic,1000);
    ROS_DEBUG("advertise /stop_flag");
    // subscribe to the scan topic and define a callback function to process the data
    ros::Subscriber laser_sub_object = my_handle.subscribe(detect_sub_topic, 1, laserScanCallback);
    ROS_DEBUG("subscriber to /scan");
    // loop 10 Hz
    ros::Rate loop_rate(10);

    // get the distance to stop
    if (my_handle.hasParam("max_dis"))
        my_handle.getParam("max_dis",max_dis);
    else
        my_handle.setParam("max_dis", max_dis);

    time_t nowtime = time(NULL);
    cout << nowtime << "    ahead!"  <<endl;
    // publish the velocity set in the call back
    while(ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();
    
        // publish
        pub_object.publish(flag);
    }

    return 0;
}
