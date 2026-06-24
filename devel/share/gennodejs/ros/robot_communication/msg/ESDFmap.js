// Auto-generated. Do not edit!

// (in-package robot_communication.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ESDFmap {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.origin_x = null;
      this.origin_y = null;
      this.resolution = null;
      this.width = null;
      this.height = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('origin_x')) {
        this.origin_x = initObj.origin_x
      }
      else {
        this.origin_x = 0.0;
      }
      if (initObj.hasOwnProperty('origin_y')) {
        this.origin_y = initObj.origin_y
      }
      else {
        this.origin_y = 0.0;
      }
      if (initObj.hasOwnProperty('resolution')) {
        this.resolution = initObj.resolution
      }
      else {
        this.resolution = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ESDFmap
    // Serialize message field [origin_x]
    bufferOffset = _serializer.float32(obj.origin_x, buffer, bufferOffset);
    // Serialize message field [origin_y]
    bufferOffset = _serializer.float32(obj.origin_y, buffer, bufferOffset);
    // Serialize message field [resolution]
    bufferOffset = _serializer.float32(obj.resolution, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.int32(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ESDFmap
    let len;
    let data = new ESDFmap(null);
    // Deserialize message field [origin_x]
    data.origin_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_y]
    data.origin_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [resolution]
    data.resolution = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.data.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_communication/ESDFmap';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a84df51ecdc0540548c40df5f4deb13';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 栅格地图的原点x值(相对世界坐标系),单位为m
    float32 origin_x
    # 栅格地图的原点y值(相对世界坐标系),单位为m
    float32 origin_y
    # 栅格地图的分辨率
    float32 resolution
    # 栅格地图的宽
    float32 width
    # 栅格地图的高
    float32 height
    
    # 一维数组，数组内的数据表示为对应栅格的占用概率。
    # 栅格地图中每一个小格的坐标对应一维数组中的一个数据。
    # 栅格数据大小代表当前点到障碍物的距离数值
    # -值表示未知区域
    int32[] data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ESDFmap(null);
    if (msg.origin_x !== undefined) {
      resolved.origin_x = msg.origin_x;
    }
    else {
      resolved.origin_x = 0.0
    }

    if (msg.origin_y !== undefined) {
      resolved.origin_y = msg.origin_y;
    }
    else {
      resolved.origin_y = 0.0
    }

    if (msg.resolution !== undefined) {
      resolved.resolution = msg.resolution;
    }
    else {
      resolved.resolution = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = ESDFmap;
