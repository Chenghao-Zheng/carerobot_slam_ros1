; Auto-generated. Do not edit!


(cl:in-package robot_communication-msg)


;//! \htmlinclude sensorData.msg.html

(cl:defclass <sensorData> (roslisp-msg-protocol:ros-message)
  ((local_x_Veloc
    :reader local_x_Veloc
    :initarg :local_x_Veloc
    :type cl:float
    :initform 0.0)
   (local_y_Veloc
    :reader local_y_Veloc
    :initarg :local_y_Veloc
    :type cl:float
    :initform 0.0)
   (local_x_Accel
    :reader local_x_Accel
    :initarg :local_x_Accel
    :type cl:float
    :initform 0.0)
   (local_y_Accel
    :reader local_y_Accel
    :initarg :local_y_Accel
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (timeStamp_10us
    :reader timeStamp_10us
    :initarg :timeStamp_10us
    :type cl:integer
    :initform 0))
)

(cl:defclass sensorData (<sensorData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sensorData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sensorData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_communication-msg:<sensorData> is deprecated: use robot_communication-msg:sensorData instead.")))

(cl:ensure-generic-function 'local_x_Veloc-val :lambda-list '(m))
(cl:defmethod local_x_Veloc-val ((m <sensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:local_x_Veloc-val is deprecated.  Use robot_communication-msg:local_x_Veloc instead.")
  (local_x_Veloc m))

(cl:ensure-generic-function 'local_y_Veloc-val :lambda-list '(m))
(cl:defmethod local_y_Veloc-val ((m <sensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:local_y_Veloc-val is deprecated.  Use robot_communication-msg:local_y_Veloc instead.")
  (local_y_Veloc m))

(cl:ensure-generic-function 'local_x_Accel-val :lambda-list '(m))
(cl:defmethod local_x_Accel-val ((m <sensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:local_x_Accel-val is deprecated.  Use robot_communication-msg:local_x_Accel instead.")
  (local_x_Accel m))

(cl:ensure-generic-function 'local_y_Accel-val :lambda-list '(m))
(cl:defmethod local_y_Accel-val ((m <sensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:local_y_Accel-val is deprecated.  Use robot_communication-msg:local_y_Accel instead.")
  (local_y_Accel m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <sensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:yaw-val is deprecated.  Use robot_communication-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'timeStamp_10us-val :lambda-list '(m))
(cl:defmethod timeStamp_10us-val ((m <sensorData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:timeStamp_10us-val is deprecated.  Use robot_communication-msg:timeStamp_10us instead.")
  (timeStamp_10us m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sensorData>) ostream)
  "Serializes a message object of type '<sensorData>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'local_x_Veloc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'local_y_Veloc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'local_x_Accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'local_y_Accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeStamp_10us)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeStamp_10us)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timeStamp_10us)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timeStamp_10us)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sensorData>) istream)
  "Deserializes a message object of type '<sensorData>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'local_x_Veloc) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'local_y_Veloc) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'local_x_Accel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'local_y_Accel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeStamp_10us)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeStamp_10us)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timeStamp_10us)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timeStamp_10us)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sensorData>)))
  "Returns string type for a message object of type '<sensorData>"
  "robot_communication/sensorData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sensorData)))
  "Returns string type for a message object of type 'sensorData"
  "robot_communication/sensorData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sensorData>)))
  "Returns md5sum for a message object of type '<sensorData>"
  "2b6cc02982ebe7cd38d12aed40230509")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sensorData)))
  "Returns md5sum for a message object of type 'sensorData"
  "2b6cc02982ebe7cd38d12aed40230509")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sensorData>)))
  "Returns full string definition for message of type '<sensorData>"
  (cl:format cl:nil "#接收到下位机发送的消息，轮速计、IMU、时间戳等~%#局部速度~%float32 local_x_Veloc~%float32 local_y_Veloc~%#局部加速度~%float32 local_x_Accel~%float32 local_y_Accel~%#yaw轴数值~%float32 yaw~%#时间戳 10us是时间戳的分辨率~%uint32 timeStamp_10us~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sensorData)))
  "Returns full string definition for message of type 'sensorData"
  (cl:format cl:nil "#接收到下位机发送的消息，轮速计、IMU、时间戳等~%#局部速度~%float32 local_x_Veloc~%float32 local_y_Veloc~%#局部加速度~%float32 local_x_Accel~%float32 local_y_Accel~%#yaw轴数值~%float32 yaw~%#时间戳 10us是时间戳的分辨率~%uint32 timeStamp_10us~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sensorData>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sensorData>))
  "Converts a ROS message object to a list"
  (cl:list 'sensorData
    (cl:cons ':local_x_Veloc (local_x_Veloc msg))
    (cl:cons ':local_y_Veloc (local_y_Veloc msg))
    (cl:cons ':local_x_Accel (local_x_Accel msg))
    (cl:cons ':local_y_Accel (local_y_Accel msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':timeStamp_10us (timeStamp_10us msg))
))
