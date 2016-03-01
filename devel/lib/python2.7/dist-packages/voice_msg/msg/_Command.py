# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from voice_msg/Command.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import voice_msg.msg

class Command(genpy.Message):
  _md5sum = "93cb2845c321adf1c318805c4ffd4891"
  _type = "voice_msg/Command"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """Motion my_motion
Navigation my_navigation
Transmit my_send
Transmit my_get

================================================================================
MSG: voice_msg/Motion
bool motion
int64 direction
int64 pattern
int64 stepcount

================================================================================
MSG: voice_msg/Navigation
bool navigation
int64 go
int64 direct
int64 columnNum
int64 rowNum

================================================================================
MSG: voice_msg/Transmit
bool transmit
int64 object
int64 didian

"""
  __slots__ = ['my_motion','my_navigation','my_send','my_get']
  _slot_types = ['voice_msg/Motion','voice_msg/Navigation','voice_msg/Transmit','voice_msg/Transmit']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       my_motion,my_navigation,my_send,my_get

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Command, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.my_motion is None:
        self.my_motion = voice_msg.msg.Motion()
      if self.my_navigation is None:
        self.my_navigation = voice_msg.msg.Navigation()
      if self.my_send is None:
        self.my_send = voice_msg.msg.Transmit()
      if self.my_get is None:
        self.my_get = voice_msg.msg.Transmit()
    else:
      self.my_motion = voice_msg.msg.Motion()
      self.my_navigation = voice_msg.msg.Navigation()
      self.my_send = voice_msg.msg.Transmit()
      self.my_get = voice_msg.msg.Transmit()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_B3qB4qB2qB2q.pack(_x.my_motion.motion, _x.my_motion.direction, _x.my_motion.pattern, _x.my_motion.stepcount, _x.my_navigation.navigation, _x.my_navigation.go, _x.my_navigation.direct, _x.my_navigation.columnNum, _x.my_navigation.rowNum, _x.my_send.transmit, _x.my_send.object, _x.my_send.didian, _x.my_get.transmit, _x.my_get.object, _x.my_get.didian))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.my_motion is None:
        self.my_motion = voice_msg.msg.Motion()
      if self.my_navigation is None:
        self.my_navigation = voice_msg.msg.Navigation()
      if self.my_send is None:
        self.my_send = voice_msg.msg.Transmit()
      if self.my_get is None:
        self.my_get = voice_msg.msg.Transmit()
      end = 0
      _x = self
      start = end
      end += 92
      (_x.my_motion.motion, _x.my_motion.direction, _x.my_motion.pattern, _x.my_motion.stepcount, _x.my_navigation.navigation, _x.my_navigation.go, _x.my_navigation.direct, _x.my_navigation.columnNum, _x.my_navigation.rowNum, _x.my_send.transmit, _x.my_send.object, _x.my_send.didian, _x.my_get.transmit, _x.my_get.object, _x.my_get.didian,) = _struct_B3qB4qB2qB2q.unpack(str[start:end])
      self.my_motion.motion = bool(self.my_motion.motion)
      self.my_navigation.navigation = bool(self.my_navigation.navigation)
      self.my_send.transmit = bool(self.my_send.transmit)
      self.my_get.transmit = bool(self.my_get.transmit)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_B3qB4qB2qB2q.pack(_x.my_motion.motion, _x.my_motion.direction, _x.my_motion.pattern, _x.my_motion.stepcount, _x.my_navigation.navigation, _x.my_navigation.go, _x.my_navigation.direct, _x.my_navigation.columnNum, _x.my_navigation.rowNum, _x.my_send.transmit, _x.my_send.object, _x.my_send.didian, _x.my_get.transmit, _x.my_get.object, _x.my_get.didian))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.my_motion is None:
        self.my_motion = voice_msg.msg.Motion()
      if self.my_navigation is None:
        self.my_navigation = voice_msg.msg.Navigation()
      if self.my_send is None:
        self.my_send = voice_msg.msg.Transmit()
      if self.my_get is None:
        self.my_get = voice_msg.msg.Transmit()
      end = 0
      _x = self
      start = end
      end += 92
      (_x.my_motion.motion, _x.my_motion.direction, _x.my_motion.pattern, _x.my_motion.stepcount, _x.my_navigation.navigation, _x.my_navigation.go, _x.my_navigation.direct, _x.my_navigation.columnNum, _x.my_navigation.rowNum, _x.my_send.transmit, _x.my_send.object, _x.my_send.didian, _x.my_get.transmit, _x.my_get.object, _x.my_get.didian,) = _struct_B3qB4qB2qB2q.unpack(str[start:end])
      self.my_motion.motion = bool(self.my_motion.motion)
      self.my_navigation.navigation = bool(self.my_navigation.navigation)
      self.my_send.transmit = bool(self.my_send.transmit)
      self.my_get.transmit = bool(self.my_get.transmit)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_B3qB4qB2qB2q = struct.Struct("<B3qB4qB2qB2q")