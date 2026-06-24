;; Auto-generated. Do not edit!


(when (boundp 'robot_communication::sensorData)
  (if (not (find-package "ROBOT_COMMUNICATION"))
    (make-package "ROBOT_COMMUNICATION"))
  (shadow 'sensorData (find-package "ROBOT_COMMUNICATION")))
(unless (find-package "ROBOT_COMMUNICATION::SENSORDATA")
  (make-package "ROBOT_COMMUNICATION::SENSORDATA"))

(in-package "ROS")
;;//! \htmlinclude sensorData.msg.html


(defclass robot_communication::sensorData
  :super ros::object
  :slots (_local_x_Veloc _local_y_Veloc _local_x_Accel _local_y_Accel _yaw _timeStamp_10us ))

(defmethod robot_communication::sensorData
  (:init
   (&key
    ((:local_x_Veloc __local_x_Veloc) 0.0)
    ((:local_y_Veloc __local_y_Veloc) 0.0)
    ((:local_x_Accel __local_x_Accel) 0.0)
    ((:local_y_Accel __local_y_Accel) 0.0)
    ((:yaw __yaw) 0.0)
    ((:timeStamp_10us __timeStamp_10us) 0)
    )
   (send-super :init)
   (setq _local_x_Veloc (float __local_x_Veloc))
   (setq _local_y_Veloc (float __local_y_Veloc))
   (setq _local_x_Accel (float __local_x_Accel))
   (setq _local_y_Accel (float __local_y_Accel))
   (setq _yaw (float __yaw))
   (setq _timeStamp_10us (round __timeStamp_10us))
   self)
  (:local_x_Veloc
   (&optional __local_x_Veloc)
   (if __local_x_Veloc (setq _local_x_Veloc __local_x_Veloc)) _local_x_Veloc)
  (:local_y_Veloc
   (&optional __local_y_Veloc)
   (if __local_y_Veloc (setq _local_y_Veloc __local_y_Veloc)) _local_y_Veloc)
  (:local_x_Accel
   (&optional __local_x_Accel)
   (if __local_x_Accel (setq _local_x_Accel __local_x_Accel)) _local_x_Accel)
  (:local_y_Accel
   (&optional __local_y_Accel)
   (if __local_y_Accel (setq _local_y_Accel __local_y_Accel)) _local_y_Accel)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:timeStamp_10us
   (&optional __timeStamp_10us)
   (if __timeStamp_10us (setq _timeStamp_10us __timeStamp_10us)) _timeStamp_10us)
  (:serialization-length
   ()
   (+
    ;; float32 _local_x_Veloc
    4
    ;; float32 _local_y_Veloc
    4
    ;; float32 _local_x_Accel
    4
    ;; float32 _local_y_Accel
    4
    ;; float32 _yaw
    4
    ;; uint32 _timeStamp_10us
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _local_x_Veloc
       (sys::poke _local_x_Veloc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _local_y_Veloc
       (sys::poke _local_y_Veloc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _local_x_Accel
       (sys::poke _local_x_Accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _local_y_Accel
       (sys::poke _local_y_Accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _timeStamp_10us
       (write-long _timeStamp_10us s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _local_x_Veloc
     (setq _local_x_Veloc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _local_y_Veloc
     (setq _local_y_Veloc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _local_x_Accel
     (setq _local_x_Accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _local_y_Accel
     (setq _local_y_Accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _timeStamp_10us
     (setq _timeStamp_10us (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_communication::sensorData :md5sum-) "2b6cc02982ebe7cd38d12aed40230509")
(setf (get robot_communication::sensorData :datatype-) "robot_communication/sensorData")
(setf (get robot_communication::sensorData :definition-)
      "#接收到下位机发送的消息，轮速计、IMU、时间戳等
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

")



(provide :robot_communication/sensorData "2b6cc02982ebe7cd38d12aed40230509")


