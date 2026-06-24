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

class sensorData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.local_x_Veloc = null;
      this.local_y_Veloc = null;
      this.local_x_Accel = null;
      this.local_y_Accel = null;
      this.yaw = null;
      this.timeStamp_10us = null;
    }
    else {
      if (initObj.hasOwnProperty('local_x_Veloc')) {
        this.local_x_Veloc = initObj.local_x_Veloc
      }
      else {
        this.local_x_Veloc = 0.0;
      }
      if (initObj.hasOwnProperty('local_y_Veloc')) {
        this.local_y_Veloc = initObj.local_y_Veloc
      }
      else {
        this.local_y_Veloc = 0.0;
      }
      if (initObj.hasOwnProperty('local_x_Accel')) {
        this.local_x_Accel = initObj.local_x_Accel
      }
      else {
        this.local_x_Accel = 0.0;
      }
      if (initObj.hasOwnProperty('local_y_Accel')) {
        this.local_y_Accel = initObj.local_y_Accel
      }
      else {
        this.local_y_Accel = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('timeStamp_10us')) {
        this.timeStamp_10us = initObj.timeStamp_10us
      }
      else {
        this.timeStamp_10us = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sensorData
    // Serialize message field [local_x_Veloc]
    bufferOffset = _serializer.float32(obj.local_x_Veloc, buffer, bufferOffset);
    // Serialize message field [local_y_Veloc]
    bufferOffset = _serializer.float32(obj.local_y_Veloc, buffer, bufferOffset);
    // Serialize message field [local_x_Accel]
    bufferOffset = _serializer.float32(obj.local_x_Accel, buffer, bufferOffset);
    // Serialize message field [local_y_Accel]
    bufferOffset = _serializer.float32(obj.local_y_Accel, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [timeStamp_10us]
    bufferOffset = _serializer.uint32(obj.timeStamp_10us, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sensorData
    let len;
    let data = new sensorData(null);
    // Deserialize message field [local_x_Veloc]
    data.local_x_Veloc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [local_y_Veloc]
    data.local_y_Veloc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [local_x_Accel]
    data.local_x_Accel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [local_y_Accel]
    data.local_y_Accel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [timeStamp_10us]
    data.timeStamp_10us = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_communication/sensorData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2b6cc02982ebe7cd38d12aed40230509';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #接收到下位机发送的消息，轮速计、IMU、时间戳等
    #局部速度
    float32 local_x_Veloc
    float32 local_y_Veloc
    #局部加速度
    float32 local_x_Accel
    float32 local_y_Accel
    #yaw轴数值
    float32 yaw
    #时间戳 10us是时间戳的分辨率
    uint32 timeStamp_10us
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sensorData(null);
    if (msg.local_x_Veloc !== undefined) {
      resolved.local_x_Veloc = msg.local_x_Veloc;
    }
    else {
      resolved.local_x_Veloc = 0.0
    }

    if (msg.local_y_Veloc !== undefined) {
      resolved.local_y_Veloc = msg.local_y_Veloc;
    }
    else {
      resolved.local_y_Veloc = 0.0
    }

    if (msg.local_x_Accel !== undefined) {
      resolved.local_x_Accel = msg.local_x_Accel;
    }
    else {
      resolved.local_x_Accel = 0.0
    }

    if (msg.local_y_Accel !== undefined) {
      resolved.local_y_Accel = msg.local_y_Accel;
    }
    else {
      resolved.local_y_Accel = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.timeStamp_10us !== undefined) {
      resolved.timeStamp_10us = msg.timeStamp_10us;
    }
    else {
      resolved.timeStamp_10us = 0
    }

    return resolved;
    }
};

module.exports = sensorData;
