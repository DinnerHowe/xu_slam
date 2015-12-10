// Generated by gencpp from file rplidar_python/rplidar_parameters.msg
// DO NOT EDIT!


#ifndef RPLIDAR_PYTHON_MESSAGE_RPLIDAR_PARAMETERS_H
#define RPLIDAR_PYTHON_MESSAGE_RPLIDAR_PARAMETERS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rplidar_python
{
template <class ContainerAllocator>
struct rplidar_parameters_
{
  typedef rplidar_parameters_<ContainerAllocator> Type;

  rplidar_parameters_()
    : angle_max(0.0)
    , angle_min(0.0)
    , angle_increment(0.0)
    , time_increment(0.0)
    , scan_time(0.0)
    , range_min(0.0)
    , range_max(0.0)
    , frame(0)  {
    }
  rplidar_parameters_(const ContainerAllocator& _alloc)
    : angle_max(0.0)
    , angle_min(0.0)
    , angle_increment(0.0)
    , time_increment(0.0)
    , scan_time(0.0)
    , range_min(0.0)
    , range_max(0.0)
    , frame(0)  {
    }



   typedef float _angle_max_type;
  _angle_max_type angle_max;

   typedef float _angle_min_type;
  _angle_min_type angle_min;

   typedef float _angle_increment_type;
  _angle_increment_type angle_increment;

   typedef float _time_increment_type;
  _time_increment_type time_increment;

   typedef float _scan_time_type;
  _scan_time_type scan_time;

   typedef float _range_min_type;
  _range_min_type range_min;

   typedef float _range_max_type;
  _range_max_type range_max;

   typedef uint64_t _frame_type;
  _frame_type frame;




  typedef boost::shared_ptr< ::rplidar_python::rplidar_parameters_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rplidar_python::rplidar_parameters_<ContainerAllocator> const> ConstPtr;

}; // struct rplidar_parameters_

typedef ::rplidar_python::rplidar_parameters_<std::allocator<void> > rplidar_parameters;

typedef boost::shared_ptr< ::rplidar_python::rplidar_parameters > rplidar_parametersPtr;
typedef boost::shared_ptr< ::rplidar_python::rplidar_parameters const> rplidar_parametersConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rplidar_python::rplidar_parameters_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace rplidar_python

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'rplidar_python': ['/home/turtlebot2/xu_slam/src/rplidar_python/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rplidar_python::rplidar_parameters_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rplidar_python::rplidar_parameters_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rplidar_python::rplidar_parameters_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >
{
  static const char* value()
  {
    return "05c2b16c1f8f5bfc65f2cc4796b6a278";
  }

  static const char* value(const ::rplidar_python::rplidar_parameters_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x05c2b16c1f8f5bfcULL;
  static const uint64_t static_value2 = 0x65f2cc4796b6a278ULL;
};

template<class ContainerAllocator>
struct DataType< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rplidar_python/rplidar_parameters";
  }

  static const char* value(const ::rplidar_python::rplidar_parameters_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 angle_max\n\
float32 angle_min\n\
float32 angle_increment\n\
float32 time_increment\n\
float32 scan_time\n\
float32 range_min\n\
float32 range_max\n\
uint64 frame\n\
";
  }

  static const char* value(const ::rplidar_python::rplidar_parameters_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.angle_max);
      stream.next(m.angle_min);
      stream.next(m.angle_increment);
      stream.next(m.time_increment);
      stream.next(m.scan_time);
      stream.next(m.range_min);
      stream.next(m.range_max);
      stream.next(m.frame);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct rplidar_parameters_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rplidar_python::rplidar_parameters_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rplidar_python::rplidar_parameters_<ContainerAllocator>& v)
  {
    s << indent << "angle_max: ";
    Printer<float>::stream(s, indent + "  ", v.angle_max);
    s << indent << "angle_min: ";
    Printer<float>::stream(s, indent + "  ", v.angle_min);
    s << indent << "angle_increment: ";
    Printer<float>::stream(s, indent + "  ", v.angle_increment);
    s << indent << "time_increment: ";
    Printer<float>::stream(s, indent + "  ", v.time_increment);
    s << indent << "scan_time: ";
    Printer<float>::stream(s, indent + "  ", v.scan_time);
    s << indent << "range_min: ";
    Printer<float>::stream(s, indent + "  ", v.range_min);
    s << indent << "range_max: ";
    Printer<float>::stream(s, indent + "  ", v.range_max);
    s << indent << "frame: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.frame);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RPLIDAR_PYTHON_MESSAGE_RPLIDAR_PARAMETERS_H