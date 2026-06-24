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

class localizationInfoBroadcast {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xPosition = null;
      this.yPosition = null;
      this.xSpeed = null;
      this.ySpeed = null;
      this.xAccel = null;
      this.yAccel = null;
      this.chassisAngle = null;
      this.chassisGyro = null;
      this.timeStamp = null;
    }
    else {
      if (initObj.hasOwnProperty('xPosition')) {
        this.xPosition = initObj.xPosition
      }
      else {
        this.xPosition = 0.0;
      }
      if (initObj.hasOwnProperty('yPosition')) {
        this.yPosition = initObj.yPosition
      }
      else {
        this.yPosition = 0.0;
      }
      if (initObj.hasOwnProperty('xSpeed')) {
        this.xSpeed = initObj.xSpeed
      }
      else {
        this.xSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('ySpeed')) {
        this.ySpeed = initObj.ySpeed
      }
      else {
        this.ySpeed = 0.0;
      }
      if (initObj.hasOwnProperty('xAccel')) {
        this.xAccel = initObj.xAccel
      }
      else {
        this.xAccel = 0.0;
      }
      if (initObj.hasOwnProperty('yAccel')) {
        this.yAccel = initObj.yAccel
      }
      else {
        this.yAccel = 0.0;
      }
      if (initObj.hasOwnProperty('chassisAngle')) {
        this.chassisAngle = initObj.chassisAngle
      }
      else {
        this.chassisAngle = 0.0;
      }
      if (initObj.hasOwnProperty('chassisGyro')) {
        this.chassisGyro = initObj.chassisGyro
      }
      else {
        this.chassisGyro = 0.0;
      }
      if (initObj.hasOwnProperty('timeStamp')) {
        this.timeStamp = initObj.timeStamp
      }
      else {
        this.timeStamp = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type localizationInfoBroadcast
    // Serialize message field [xPosition]
    bufferOffset = _serializer.float32(obj.xPosition, buffer, bufferOffset);
    // Serialize message field [yPosition]
    bufferOffset = _serializer.float32(obj.yPosition, buffer, bufferOffset);
    // Serialize message field [xSpeed]
    bufferOffset = _serializer.float32(obj.xSpeed, buffer, bufferOffset);
    // Serialize message field [ySpeed]
    bufferOffset = _serializer.float32(obj.ySpeed, buffer, bufferOffset);
    // Serialize message field [xAccel]
    bufferOffset = _serializer.float32(obj.xAccel, buffer, bufferOffset);
    // Serialize message field [yAccel]
    bufferOffset = _serializer.float32(obj.yAccel, buffer, bufferOffset);
    // Serialize message field [chassisAngle]
    bufferOffset = _serializer.float32(obj.chassisAngle, buffer, bufferOffset);
    // Serialize message field [chassisGyro]
    bufferOffset = _serializer.float32(obj.chassisGyro, buffer, bufferOffset);
    // Serialize message field [timeStamp]
    bufferOffset = _serializer.uint32(obj.timeStamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type localizationInfoBroadcast
    let len;
    let data = new localizationInfoBroadcast(null);
    // Deserialize message field [xPosition]
    data.xPosition = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yPosition]
    data.yPosition = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xSpeed]
    data.xSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ySpeed]
    data.ySpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xAccel]
    data.xAccel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yAccel]
    data.yAccel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [chassisAngle]
    data.chassisAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [chassisGyro]
    data.chassisGyro = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [timeStamp]
    data.timeStamp = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_communication/localizationInfoBroadcast';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93de7300af4a3e98ca0a4ec3c9466b01';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 定位消息广播需要数据
    # 全局x位置
    float32 xPosition
    # 全局y位置
    float32 yPosition
    #全局x轴线速度
    float32 xSpeed 
    #全局y轴线速度
    float32 ySpeed
    #车体x加速度
    float32 xAccel 
    #车体y加速度
    float32 yAccel
    #底盘角度
    float32 chassisAngle
    #底盘角速度
    float32 chassisGyro
    # 时间戳
    uint32 timeStamp
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new localizationInfoBroadcast(null);
    if (msg.xPosition !== undefined) {
      resolved.xPosition = msg.xPosition;
    }
    else {
      resolved.xPosition = 0.0
    }

    if (msg.yPosition !== undefined) {
      resolved.yPosition = msg.yPosition;
    }
    else {
      resolved.yPosition = 0.0
    }

    if (msg.xSpeed !== undefined) {
      resolved.xSpeed = msg.xSpeed;
    }
    else {
      resolved.xSpeed = 0.0
    }

    if (msg.ySpeed !== undefined) {
      resolved.ySpeed = msg.ySpeed;
    }
    else {
      resolved.ySpeed = 0.0
    }

    if (msg.xAccel !== undefined) {
      resolved.xAccel = msg.xAccel;
    }
    else {
      resolved.xAccel = 0.0
    }

    if (msg.yAccel !== undefined) {
      resolved.yAccel = msg.yAccel;
    }
    else {
      resolved.yAccel = 0.0
    }

    if (msg.chassisAngle !== undefined) {
      resolved.chassisAngle = msg.chassisAngle;
    }
    else {
      resolved.chassisAngle = 0.0
    }

    if (msg.chassisGyro !== undefined) {
      resolved.chassisGyro = msg.chassisGyro;
    }
    else {
      resolved.chassisGyro = 0.0
    }

    if (msg.timeStamp !== undefined) {
      resolved.timeStamp = msg.timeStamp;
    }
    else {
      resolved.timeStamp = 0
    }

    return resolved;
    }
};

module.exports = localizationInfoBroadcast;
