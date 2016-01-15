// Generated by gencpp from file voice_interface/Get.msg
// DO NOT EDIT!


#ifndef VOICE_INTERFACE_MESSAGE_GET_H
#define VOICE_INTERFACE_MESSAGE_GET_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace voice_interface
{
template <class ContainerAllocator>
struct Get_
{
  typedef Get_<ContainerAllocator> Type;

  Get_()
    : get(false)
    , rencheng2(0)
    , operation(0)
    , object2(0)
    , action(0)  {
    }
  Get_(const ContainerAllocator& _alloc)
    : get(false)
    , rencheng2(0)
    , operation(0)
    , object2(0)
    , action(0)  {
    }



   typedef uint8_t _get_type;
  _get_type get;

   typedef int64_t _rencheng2_type;
  _rencheng2_type rencheng2;

   typedef int64_t _operation_type;
  _operation_type operation;

   typedef int64_t _object2_type;
  _object2_type object2;

   typedef int64_t _action_type;
  _action_type action;




  typedef boost::shared_ptr< ::voice_interface::Get_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::voice_interface::Get_<ContainerAllocator> const> ConstPtr;

}; // struct Get_

typedef ::voice_interface::Get_<std::allocator<void> > Get;

typedef boost::shared_ptr< ::voice_interface::Get > GetPtr;
typedef boost::shared_ptr< ::voice_interface::Get const> GetConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::voice_interface::Get_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::voice_interface::Get_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace voice_interface

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'voice_interface': ['/home/turtlebot2/xu_slam/src/voice_interface/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::voice_interface::Get_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::voice_interface::Get_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::voice_interface::Get_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::voice_interface::Get_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::voice_interface::Get_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::voice_interface::Get_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::voice_interface::Get_<ContainerAllocator> >
{
  static const char* value()
  {
    return "712d3f98ffc20e1bda6fa2b3c9033441";
  }

  static const char* value(const ::voice_interface::Get_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x712d3f98ffc20e1bULL;
  static const uint64_t static_value2 = 0xda6fa2b3c9033441ULL;
};

template<class ContainerAllocator>
struct DataType< ::voice_interface::Get_<ContainerAllocator> >
{
  static const char* value()
  {
    return "voice_interface/Get";
  }

  static const char* value(const ::voice_interface::Get_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::voice_interface::Get_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool get\n\
int64 rencheng2\n\
int64 operation\n\
int64 object2\n\
int64 action\n\
";
  }

  static const char* value(const ::voice_interface::Get_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::voice_interface::Get_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.get);
      stream.next(m.rencheng2);
      stream.next(m.operation);
      stream.next(m.object2);
      stream.next(m.action);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct Get_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::voice_interface::Get_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::voice_interface::Get_<ContainerAllocator>& v)
  {
    s << indent << "get: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.get);
    s << indent << "rencheng2: ";
    Printer<int64_t>::stream(s, indent + "  ", v.rencheng2);
    s << indent << "operation: ";
    Printer<int64_t>::stream(s, indent + "  ", v.operation);
    s << indent << "object2: ";
    Printer<int64_t>::stream(s, indent + "  ", v.object2);
    s << indent << "action: ";
    Printer<int64_t>::stream(s, indent + "  ", v.action);
  }
};

} // namespace message_operations
} // namespace ros

#endif // VOICE_INTERFACE_MESSAGE_GET_H