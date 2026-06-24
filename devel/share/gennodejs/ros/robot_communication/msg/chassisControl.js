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

class chassisControl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xSpeed = null;
      this.ySpeed = null;
      this.chassisAngle = null;
      this.chassisGyro = null;
      this.timeStamp = null;
      this.globalOrlocal = null;
    }
    else {
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
      if (initObj.hasOwnProperty('globalOrlocal')) {
        this.globalOrlocal = initObj.globalOrlocal
      }
      else {
        this.globalOrlocal = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type chassisControl
    // Serialize message field [xSpeed]
    bufferOffset = _serializer.float32(obj.xSpeed, buffer, bufferOffset);
    // Serialize message field [ySpeed]
    bufferOffset = _serializer.float32(obj.ySpeed, buffer, bufferOffset);
    // Serialize message field [chassisAngle]
    bufferOffset = _serializer.float32(obj.chassisAngle, buffer, bufferOffset);
    // Serialize message field [chassisGyro]
    bufferOffset = _serializer.float32(obj.chassisGyro, buffer, bufferOffset);
    // Serialize message field [timeStamp]
    bufferOffset = _serializer.uint32(obj.timeStamp, buffer, bufferOffset);
    // Serialize message field [globalOrlocal]
    bufferOffset = _serializer.bool(obj.globalOrlocal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type chassisControl
    let len;
    let data = new chassisControl(null);
    // Deserialize message field [xSpeed]
    data.xSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ySpeed]
    data.ySpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [chassisAngle]
    data.chassisAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [chassisGyro]
    data.chassisGyro = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [timeStamp]
    data.timeStamp = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [globalOrlocal]
    data.globalOrlocal = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_communication/chassisControl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ba44848e12b315b92df95a3f875577ab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 导航发布的消息
    #全局x轴线速度
    float32 xSpeed 
    #全局y轴线速度
    float32 ySpeed
    #底盘角度
    float32 chassisAngle
    #底盘角速度
    float32 chassisGyro
    # 时间戳
    uint32 timeStamp
    # 标志位局部控制还是全局控制
    bool globalOrlocal
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new chassisControl(null);
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

    if (msg.globalOrlocal !== undefined) {
      resolved.globalOrlocal = msg.globalOrlocal;
    }
    else {
      resolved.globalOrlocal = false
    }

    return resolved;
    }
};

module.exports = chassisControl;
