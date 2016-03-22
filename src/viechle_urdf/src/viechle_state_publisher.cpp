#include <string>
#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>

int main(int argc, char** argv) {
    ros::init(argc, argv, "viechle_state_publisher");
    ros::NodeHandle n;
    ros::Publisher joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
    tf::TransformBroadcaster broadcaster;
    ros::Rate loop_rate(30);
    double radius;
    double wheel;
    const double degree = M_PI/180;
    if (ros::param::has("~radius"))
     radius = ros::param::get("~radius", radius);
    else
     ros::param::set("~radius", 3);
     radius = ros::param::get("~radius", radius);
    // robot state
    double angle=0;

    // message declarations
    geometry_msgs::TransformStamped odom_trans;
    sensor_msgs::JointState joint_state;
    odom_trans.header.frame_id = "odom";
    odom_trans.child_frame_id = "base_link";

    while (ros::ok()) {
        //update joint_state
        joint_state.header.stamp = ros::Time::now();
        joint_state.name.resize(4);
        joint_state.position.resize(4);
        joint_state.name[0] ="joint_base_wheel1";
        joint_state.position[0] = wheel;
        joint_state.name[1] ="joint_base_wheel2";
        joint_state.position[1] = wheel;
        joint_state.name[2] ="joint_base_wheel3";
        joint_state.position[2] = wheel;
        joint_state.name[3] ="joint_base_wheel4";
        joint_state.position[3] = wheel;


        // update transform
        odom_trans.header.stamp = ros::Time::now();
        odom_trans.transform.translation.x = radius*cos(angle);
        odom_trans.transform.translation.y = radius*sin(angle);
        odom_trans.transform.translation.z = .7;
        odom_trans.transform.rotation = tf::createQuaternionMsgFromYaw(angle+M_PI/2);

        //send the joint state and transform
        joint_pub.publish(joint_state);
        broadcaster.sendTransform(odom_trans);

        // Create new robot state
        if (wheel > M_PI*2)
          wheel=0;
        else 
          wheel += degree/4;
        angle += degree/4;

        // This will adjust as needed per iteration
        loop_rate.sleep();
    }


    return 0;
}
