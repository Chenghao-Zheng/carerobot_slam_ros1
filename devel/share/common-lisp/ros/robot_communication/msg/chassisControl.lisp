; Auto-generated. Do not edit!


(cl:in-package robot_communication-msg)


;//! \htmlinclude chassisControl.msg.html

(cl:defclass <chassisControl> (roslisp-msg-protocol:ros-message)
  ((xSpeed
    :reader xSpeed
    :initarg :xSpeed
    :type cl:float
    :initform 0.0)
   (ySpeed
    :reader ySpeed
    :initarg :ySpeed
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
    :initform 0)
   (globalOrlocal
    :reader globalOrlocal
    :initarg :globalOrlocal
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass chassisControl (<chassisControl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <chassisControl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'chassisControl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_communication-msg:<chassisControl> is deprecated: use robot_communication-msg:chassisControl instead.")))

(cl:ensure-generic-function 'xSpeed-val :lambda-list '(m))
(cl:defmethod xSpeed-val ((m <chassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:xSpeed-val is deprecated.  Use robot_communication-msg:xSpeed instead.")
  (xSpeed m))

(cl:ensure-generic-function 'ySpeed-val :lambda-list '(m))
(cl:defmethod ySpeed-val ((m <chassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:ySpeed-val is deprecated.  Use robot_communication-msg:ySpeed instead.")
  (ySpeed m))

(cl:ensure-generic-function 'chassisAngle-val :lambda-list '(m))
(cl:defmethod chassisAngle-val ((m <chassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:chassisAngle-val is deprecated.  Use robot_communication-msg:chassisAngle instead.")
  (chassisAngle m))

(cl:ensure-generic-function 'chassisGyro-val :lambda-list '(m))
(cl:defmethod chassisGyro-val ((m <chassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:chassisGyro-val is deprecated.  Use robot_communication-msg:chassisGyro instead.")
  (chassisGyro m))

(cl:ensure-generic-function 'timeStamp-val :lambda-list '(m))
(cl:defmethod timeStamp-val ((m <chassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:timeStamp-val is deprecated.  Use robot_communication-msg:timeStamp instead.")
  (timeStamp m))

(cl:ensure-generic-function 'globalOrlocal-val :lambda-list '(m))
(cl:defmethod globalOrlocal-val ((m <chassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:globalOrlocal-val is deprecated.  Use robot_communication-msg:globalOrlocal instead.")
  (globalOrlocal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <chassisControl>) ostream)
  "Serializes a message object of type '<chassisControl>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'globalOrlocal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <chassisControl>) istream)
  "Deserializes a message object of type '<chassisControl>"
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
    (cl:setf (cl:slot-value msg 'globalOrlocal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<chassisControl>)))
  "Returns string type for a message object of type '<chassisControl>"
  "robot_communication/chassisControl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'chassisControl)))
  "Returns string type for a message object of type 'chassisControl"
  "robot_communication/chassisControl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<chassisControl>)))
  "Returns md5sum for a message object of type '<chassisControl>"
  "ba44848e12b315b92df95a3f875577ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'chassisControl)))
  "Returns md5sum for a message object of type 'chassisControl"
  "ba44848e12b315b92df95a3f875577ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<chassisControl>)))
  "Returns full string definition for message of type '<chassisControl>"
  (cl:format cl:nil "# 导航发布的消息~%#全局x轴线速度~%float32 xSpeed ~%#全局y轴线速度~%float32 ySpeed~%#底盘角度~%float32 chassisAngle~%#底盘角速度~%float32 chassisGyro~%# 时间戳~%uint32 timeStamp~%# 标志位局部控制还是全局控制~%bool globalOrlocal~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'chassisControl)))
  "Returns full string definition for message of type 'chassisControl"
  (cl:format cl:nil "# 导航发布的消息~%#全局x轴线速度~%float32 xSpeed ~%#全局y轴线速度~%float32 ySpeed~%#底盘角度~%float32 chassisAngle~%#底盘角速度~%float32 chassisGyro~%# 时间戳~%uint32 timeStamp~%# 标志位局部控制还是全局控制~%bool globalOrlocal~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <chassisControl>))
  (cl:+ 0
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <chassisControl>))
  "Converts a ROS message object to a list"
  (cl:list 'chassisControl
    (cl:cons ':xSpeed (xSpeed msg))
    (cl:cons ':ySpeed (ySpeed msg))
    (cl:cons ':chassisAngle (chassisAngle msg))
    (cl:cons ':chassisGyro (chassisGyro msg))
    (cl:cons ':timeStamp (timeStamp msg))
    (cl:cons ':globalOrlocal (globalOrlocal msg))
))
