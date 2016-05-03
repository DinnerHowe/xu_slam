#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/LaserScan.h>
#include <std_msgs/String.h>
#include <time.h> 
#include <iostream>

geometry_msgs::Twist velocityCommand;
std_msgs::String flag;

using namespace std;

void laserScanCallback(const sensor_msgs::LaserScan::ConstPtr& laserScanData)
{
      // Example of using some of the non-range data-types
      float rangeDataNum =  1 + (laserScanData->angle_max -laserScanData->angle_min)/(laserScanData->angle_increment);

      velocityCommand.linear.x = 0.1;

      // Go through the laser data
      for(int j = 0; j < rangeDataNum; ++j)
      {
             if( laserScanData->ranges[j] < 2 )
             {
                  time_t nowtime = time(NULL);
                    velocityCommand.linear.x = 0;
                    flag.data = "stop";
                    cout << nowtime << "    stop!"  <<endl;
                    break;
             }
      }
}

int main (int argc, char **argv)
{
      // command line ROS arguments
      ros::init(argc, argv, "pioneer_laser_node");

      // ROS comms access point
      ros::NodeHandle my_handle;

      ros::Publisher vel_pub_object = my_handle.advertise<geometry_msgs::Twist>("/cmd_vel_mex/input/teleop",1);
      ros::Publisher pub_object = my_handle.advertise<std_msgs::String>("/stop_flag",1000);
      // subscribe to the scan topic and define a callback function to process the data
      ros::Subscriber laser_sub_object = my_handle.subscribe("/scan", 1, laserScanCallback);

      // loop 10 Hz
      ros::Rate loop_rate(10);

      // publish the velocity set in the call back
      while(ros::ok())
      {
             ros::spinOnce();
             loop_rate.sleep();

             // publish
             vel_pub_object.publish(velocityCommand);
             pub_object.publish(flag);
      }

      return 0;
}
