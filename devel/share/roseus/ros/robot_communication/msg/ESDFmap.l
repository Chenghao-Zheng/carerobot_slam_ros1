;; Auto-generated. Do not edit!


(when (boundp 'robot_communication::ESDFmap)
  (if (not (find-package "ROBOT_COMMUNICATION"))
    (make-package "ROBOT_COMMUNICATION"))
  (shadow 'ESDFmap (find-package "ROBOT_COMMUNICATION")))
(unless (find-package "ROBOT_COMMUNICATION::ESDFMAP")
  (make-package "ROBOT_COMMUNICATION::ESDFMAP"))

(in-package "ROS")
;;//! \htmlinclude ESDFmap.msg.html


(defclass robot_communication::ESDFmap
  :super ros::object
  :slots (_origin_x _origin_y _resolution _width _height _data ))

(defmethod robot_communication::ESDFmap
  (:init
   (&key
    ((:origin_x __origin_x) 0.0)
    ((:origin_y __origin_y) 0.0)
    ((:resolution __resolution) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _origin_x (float __origin_x))
   (setq _origin_y (float __origin_y))
   (setq _resolution (float __resolution))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _data __data)
   self)
  (:origin_x
   (&optional __origin_x)
   (if __origin_x (setq _origin_x __origin_x)) _origin_x)
  (:origin_y
   (&optional __origin_y)
   (if __origin_y (setq _origin_y __origin_y)) _origin_y)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float32 _origin_x
    4
    ;; float32 _origin_y
    4
    ;; float32 _resolution
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; int32[] _data
    (* 4    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _origin_x
       (sys::poke _origin_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _origin_y
       (sys::poke _origin_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-long (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _origin_x
     (setq _origin_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _origin_y
     (setq _origin_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _resolution
     (setq _resolution (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get robot_communication::ESDFmap :md5sum-) "8a84df51ecdc0540548c40df5f4deb13")
(setf (get robot_communication::ESDFmap :datatype-) "robot_communication/ESDFmap")
(setf (get robot_communication::ESDFmap :definition-)
      "# 栅格地图的原点x值(相对世界坐标系),单位为m
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

")



(provide :robot_communication/ESDFmap "8a84df51ecdc0540548c40df5f4deb13")


