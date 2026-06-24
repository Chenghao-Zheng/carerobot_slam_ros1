; Auto-generated. Do not edit!


(cl:in-package robot_communication-msg)


;//! \htmlinclude goal.msg.html

(cl:defclass <goal> (roslisp-msg-protocol:ros-message)
  ((Position_x
    :reader Position_x
    :initarg :Position_x
    :type cl:float
    :initform 0.0)
   (Position_y
    :reader Position_y
    :initarg :Position_y
    :type cl:float
    :initform 0.0)
   (Position_yaw
    :reader Position_yaw
    :initarg :Position_yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass goal (<goal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <goal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'goal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_communication-msg:<goal> is deprecated: use robot_communication-msg:goal instead.")))

(cl:ensure-generic-function 'Position_x-val :lambda-list '(m))
(cl:defmethod Position_x-val ((m <goal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:Position_x-val is deprecated.  Use robot_communication-msg:Position_x instead.")
  (Position_x m))

(cl:ensure-generic-function 'Position_y-val :lambda-list '(m))
(cl:defmethod Position_y-val ((m <goal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:Position_y-val is deprecated.  Use robot_communication-msg:Position_y instead.")
  (Position_y m))

(cl:ensure-generic-function 'Position_yaw-val :lambda-list '(m))
(cl:defmethod Position_yaw-val ((m <goal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:Position_yaw-val is deprecated.  Use robot_communication-msg:Position_yaw instead.")
  (Position_yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <goal>) ostream)
  "Serializes a message object of type '<goal>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Position_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Position_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Position_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <goal>) istream)
  "Deserializes a message object of type '<goal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Position_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Position_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Position_yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<goal>)))
  "Returns string type for a message object of type '<goal>"
  "robot_communication/goal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'goal)))
  "Returns string type for a message object of type 'goal"
  "robot_communication/goal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<goal>)))
  "Returns md5sum for a message object of type '<goal>"
  "529b653ff7a616d53e93e8d91f1e84eb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'goal)))
  "Returns md5sum for a message object of type 'goal"
  "529b653ff7a616d53e93e8d91f1e84eb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<goal>)))
  "Returns full string definition for message of type '<goal>"
  (cl:format cl:nil "# 目标点信息~%# x位置信息~%float32 Position_x~%# y位置信息~%float32 Position_y~%# yaw轴角度信息~%float32 Position_yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'goal)))
  "Returns full string definition for message of type 'goal"
  (cl:format cl:nil "# 目标点信息~%# x位置信息~%float32 Position_x~%# y位置信息~%float32 Position_y~%# yaw轴角度信息~%float32 Position_yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <goal>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <goal>))
  "Converts a ROS message object to a list"
  (cl:list 'goal
    (cl:cons ':Position_x (Position_x msg))
    (cl:cons ':Position_y (Position_y msg))
    (cl:cons ':Position_yaw (Position_yaw msg))
))
