; Auto-generated. Do not edit!


(cl:in-package robot_communication-msg)


;//! \htmlinclude localizationInfoBroadcast.msg.html

(cl:defclass <localizationInfoBroadcast> (roslisp-msg-protocol:ros-message)
  ((xPosition
    :reader xPosition
    :initarg :xPosition
    :type cl:float
    :initform 0.0)
   (yPosition
    :reader yPosition
    :initarg :yPosition
    :type cl:float
    :initform 0.0)
   (xSpeed
    :reader xSpeed
    :initarg :xSpeed
    :type cl:float
    :initform 0.0)
   (ySpeed
    :reader ySpeed
    :initarg :ySpeed
    :type cl:float
    :initform 0.0)
   (xAccel
    :reader xAccel
    :initarg :xAccel
    :type cl:float
    :initform 0.0)
   (yAccel
    :reader yAccel
    :initarg :yAccel
    :type cl:float
    :initform 0.0)
   (chassisAngle
    :reader chassisAngle
    :initarg :chassisAngle
    :type cl:float
    :initform 0.0)
   (chassisGyro
    :reader chassisGyro
    :initarg :chassisGyro
    :type cl:float
    :initform 0.0)
   (timeStamp
    :reader timeStamp
    :initarg :timeStamp
    :type cl:integer
    :initform 0))
)

(cl:defclass localizationInfoBroadcast (<localizationInfoBroadcast>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <localizationInfoBroadcast>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'localizationInfoBroadcast)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_communication-msg:<localizationInfoBroadcast> is deprecated: use robot_communication-msg:localizationInfoBroadcast instead.")))

(cl:ensure-generic-function 'xPosition-val :lambda-list '(m))
(cl:defmethod xPosition-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:xPosition-val is deprecated.  Use robot_communication-msg:xPosition instead.")
  (xPosition m))

(cl:ensure-generic-function 'yPosition-val :lambda-list '(m))
(cl:defmethod yPosition-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:yPosition-val is deprecated.  Use robot_communication-msg:yPosition instead.")
  (yPosition m))

(cl:ensure-generic-function 'xSpeed-val :lambda-list '(m))
(cl:defmethod xSpeed-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:xSpeed-val is deprecated.  Use robot_communication-msg:xSpeed instead.")
  (xSpeed m))

(cl:ensure-generic-function 'ySpeed-val :lambda-list '(m))
(cl:defmethod ySpeed-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:ySpeed-val is deprecated.  Use robot_communication-msg:ySpeed instead.")
  (ySpeed m))

(cl:ensure-generic-function 'xAccel-val :lambda-list '(m))
(cl:defmethod xAccel-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:xAccel-val is deprecated.  Use robot_communication-msg:xAccel instead.")
  (xAccel m))

(cl:ensure-generic-function 'yAccel-val :lambda-list '(m))
(cl:defmethod yAccel-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:yAccel-val is deprecated.  Use robot_communication-msg:yAccel instead.")
  (yAccel m))

(cl:ensure-generic-function 'chassisAngle-val :lambda-list '(m))
(cl:defmethod chassisAngle-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:chassisAngle-val is deprecated.  Use robot_communication-msg:chassisAngle instead.")
  (chassisAngle m))

(cl:ensure-generic-function 'chassisGyro-val :lambda-list '(m))
(cl:defmethod chassisGyro-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:chassisGyro-val is deprecated.  Use robot_communication-msg:chassisGyro instead.")
  (chassisGyro m))

(cl:ensure-generic-function 'timeStamp-val :lambda-list '(m))
(cl:defmethod timeStamp-val ((m <localizationInfoBroadcast>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:timeStamp-val is deprecated.  Use robot_communication-msg:timeStamp instead.")
  (timeStamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <localizationInfoBroadcast>) ostream)
  "Serializes a message object of type '<localizationInfoBroadcast>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xPosition))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yPosition))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ySpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xAccel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yAccel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'chassisAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'chassisGyro))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeStamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeStamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timeStamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timeStamp)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <localizationInfoBroadcast>) istream)
  "Deserializes a message object of type '<localizationInfoBroadcast>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xPosition) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yPosition) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xSpeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ySpeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xAccel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yAccel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'chassisAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'chassisGyro) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeStamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeStamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timeStamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timeStamp)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<localizationInfoBroadcast>)))
  "Returns string type for a message object of type '<localizationInfoBroadcast>"
  "robot_communication/localizationInfoBroadcast")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'localizationInfoBroadcast)))
  "Returns string type for a message object of type 'localizationInfoBroadcast"
  "robot_communication/localizationInfoBroadcast")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<localizationInfoBroadcast>)))
  "Returns md5sum for a message object of type '<localizationInfoBroadcast>"
  "93de7300af4a3e98ca0a4ec3c9466b01")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'localizationInfoBroadcast)))
  "Returns md5sum for a message object of type 'localizationInfoBroadcast"
  "93de7300af4a3e98ca0a4ec3c9466b01")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<localizationInfoBroadcast>)))
  "Returns full string definition for message of type '<localizationInfoBroadcast>"
  (cl:format cl:nil "# 定位消息广播需要数据~%# 全局x位置~%float32 xPosition~%# 全局y位置~%float32 yPosition~%#全局x轴线速度~%float32 xSpeed ~%#全局y轴线速度~%float32 ySpeed~%#车体x加速度~%float32 xAccel ~%#车体y加速度~%float32 yAccel~%#底盘角度~%float32 chassisAngle~%#底盘角速度~%float32 chassisGyro~%# 时间戳~%uint32 timeStamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'localizationInfoBroadcast)))
  "Returns full string definition for message of type 'localizationInfoBroadcast"
  (cl:format cl:nil "# 定位消息广播需要数据~%# 全局x位置~%float32 xPosition~%# 全局y位置~%float32 yPosition~%#全局x轴线速度~%float32 xSpeed ~%#全局y轴线速度~%float32 ySpeed~%#车体x加速度~%float32 xAccel ~%#车体y加速度~%float32 yAccel~%#底盘角度~%float32 chassisAngle~%#底盘角速度~%float32 chassisGyro~%# 时间戳~%uint32 timeStamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <localizationInfoBroadcast>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <localizationInfoBroadcast>))
  "Converts a ROS message object to a list"
  (cl:list 'localizationInfoBroadcast
    (cl:cons ':xPosition (xPosition msg))
    (cl:cons ':yPosition (yPosition msg))
    (cl:cons ':xSpeed (xSpeed msg))
    (cl:cons ':ySpeed (ySpeed msg))
    (cl:cons ':xAccel (xAccel msg))
    (cl:cons ':yAccel (yAccel msg))
    (cl:cons ':chassisAngle (chassisAngle msg))
    (cl:cons ':chassisGyro (chassisGyro msg))
    (cl:cons ':timeStamp (timeStamp msg))
))
