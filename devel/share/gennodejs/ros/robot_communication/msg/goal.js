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

class goal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Position_x = null;
      this.Position_y = null;
      this.Position_yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('Position_x')) {
        this.Position_x = initObj.Position_x
      }
      else {
        this.Position_x = 0.0;
      }
      if (initObj.hasOwnProperty('Position_y')) {
        this.Position_y = initObj.Position_y
      }
      else {
        this.Position_y = 0.0;
      }
      if (initObj.hasOwnProperty('Position_yaw')) {
        this.Position_yaw = initObj.Position_yaw
      }
      else {
        this.Position_yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type goal
    // Serialize message field [Position_x]
    bufferOffset = _serializer.float32(obj.Position_x, buffer, bufferOffset);
    // Serialize message field [Position_y]
    bufferOffset = _serializer.float32(obj.Position_y, buffer, bufferOffset);
    // Serialize message field [Position_yaw]
    bufferOffset = _serializer.float32(obj.Position_yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type goal
    let len;
    let data = new goal(null);
    // Deserialize message field [Position_x]
    data.Position_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_y]
    data.Position_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_yaw]
    data.Position_yaw = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_communication/goal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '529b653ff7a616d53e93e8d91f1e84eb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 目标点信息
    # x位置信息
    float32 Position_x
    # y位置信息
    float32 Position_y
    # yaw轴角度信息
    float32 Position_yaw
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new goal(null);
    if (msg.Position_x !== undefined) {
      resolved.Position_x = msg.Position_x;
    }
    else {
      resolved.Position_x = 0.0
    }

    if (msg.Position_y !== undefined) {
      resolved.Position_y = msg.Position_y;
    }
    else {
      resolved.Position_y = 0.0
    }

    if (msg.Position_yaw !== undefined) {
      resolved.Position_yaw = msg.Position_yaw;
    }
    else {
      resolved.Position_yaw = 0.0
    }

    return resolved;
    }
};

module.exports = goal;
