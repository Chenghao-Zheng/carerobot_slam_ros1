; Auto-generated. Do not edit!


(cl:in-package robot_communication-msg)


;//! \htmlinclude ESDFmap.msg.html

(cl:defclass <ESDFmap> (roslisp-msg-protocol:ros-message)
  ((origin_x
    :reader origin_x
    :initarg :origin_x
    :type cl:float
    :initform 0.0)
   (origin_y
    :reader origin_y
    :initarg :origin_y
    :type cl:float
    :initform 0.0)
   (resolution
    :reader resolution
    :initarg :resolution
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass ESDFmap (<ESDFmap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ESDFmap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ESDFmap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_communication-msg:<ESDFmap> is deprecated: use robot_communication-msg:ESDFmap instead.")))

(cl:ensure-generic-function 'origin_x-val :lambda-list '(m))
(cl:defmethod origin_x-val ((m <ESDFmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:origin_x-val is deprecated.  Use robot_communication-msg:origin_x instead.")
  (origin_x m))

(cl:ensure-generic-function 'origin_y-val :lambda-list '(m))
(cl:defmethod origin_y-val ((m <ESDFmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:origin_y-val is deprecated.  Use robot_communication-msg:origin_y instead.")
  (origin_y m))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <ESDFmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:resolution-val is deprecated.  Use robot_communication-msg:resolution instead.")
  (resolution m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <ESDFmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:width-val is deprecated.  Use robot_communication-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <ESDFmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:height-val is deprecated.  Use robot_communication-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <ESDFmap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_communication-msg:data-val is deprecated.  Use robot_communication-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ESDFmap>) ostream)
  "Serializes a message object of type '<ESDFmap>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ESDFmap>) istream)
  "Deserializes a message object of type '<ESDFmap>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'resolution) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ESDFmap>)))
  "Returns string type for a message object of type '<ESDFmap>"
  "robot_communication/ESDFmap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ESDFmap)))
  "Returns string type for a message object of type 'ESDFmap"
  "robot_communication/ESDFmap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ESDFmap>)))
  "Returns md5sum for a message object of type '<ESDFmap>"
  "8a84df51ecdc0540548c40df5f4deb13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ESDFmap)))
  "Returns md5sum for a message object of type 'ESDFmap"
  "8a84df51ecdc0540548c40df5f4deb13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ESDFmap>)))
  "Returns full string definition for message of type '<ESDFmap>"
  (cl:format cl:nil "# 栅格地图的原点x值(相对世界坐标系),单位为m~%float32 origin_x~%# 栅格地图的原点y值(相对世界坐标系),单位为m~%float32 origin_y~%# 栅格地图的分辨率~%float32 resolution~%# 栅格地图的宽~%float32 width~%# 栅格地图的高~%float32 height~%~%# 一维数组，数组内的数据表示为对应栅格的占用概率。~%# 栅格地图中每一个小格的坐标对应一维数组中的一个数据。~%# 栅格数据大小代表当前点到障碍物的距离数值~%# -值表示未知区域~%int32[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ESDFmap)))
  "Returns full string definition for message of type 'ESDFmap"
  (cl:format cl:nil "# 栅格地图的原点x值(相对世界坐标系),单位为m~%float32 origin_x~%# 栅格地图的原点y值(相对世界坐标系),单位为m~%float32 origin_y~%# 栅格地图的分辨率~%float32 resolution~%# 栅格地图的宽~%float32 width~%# 栅格地图的高~%float32 height~%~%# 一维数组，数组内的数据表示为对应栅格的占用概率。~%# 栅格地图中每一个小格的坐标对应一维数组中的一个数据。~%# 栅格数据大小代表当前点到障碍物的距离数值~%# -值表示未知区域~%int32[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ESDFmap>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ESDFmap>))
  "Converts a ROS message object to a list"
  (cl:list 'ESDFmap
    (cl:cons ':origin_x (origin_x msg))
    (cl:cons ':origin_y (origin_y msg))
    (cl:cons ':resolution (resolution msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':data (data msg))
))
