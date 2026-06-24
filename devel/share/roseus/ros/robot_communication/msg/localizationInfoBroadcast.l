;; Auto-generated. Do not edit!


(when (boundp 'robot_communication::localizationInfoBroadcast)
  (if (not (find-package "ROBOT_COMMUNICATION"))
    (make-package "ROBOT_COMMUNICATION"))
  (shadow 'localizationInfoBroadcast (find-package "ROBOT_COMMUNICATION")))
(unless (find-package "ROBOT_COMMUNICATION::LOCALIZATIONINFOBROADCAST")
  (make-package "ROBOT_COMMUNICATION::LOCALIZATIONINFOBROADCAST"))

(in-package "ROS")
;;//! \htmlinclude localizationInfoBroadcast.msg.html


(defclass robot_communication::localizationInfoBroadcast
  :super ros::object
  :slots (_xPosition _yPosition _xSpeed _ySpeed _xAccel _yAccel _chassisAngle _chassisGyro _timeStamp ))

(defmethod robot_communication::localizationInfoBroadcast
  (:init
   (&key
    ((:xPosition __xPosition) 0.0)
    ((:yPosition __yPosition) 0.0)
    ((:xSpeed __xSpeed) 0.0)
    ((:ySpeed __ySpeed) 0.0)
    ((:xAccel __xAccel) 0.0)
    ((:yAccel __yAccel) 0.0)
    ((:chassisAngle __chassisAngle) 0.0)
    ((:chassisGyro __chassisGyro) 0.0)
    ((:timeStamp __timeStamp) 0)
    )
   (send-super :init)
   (setq _xPosition (float __xPosition))
   (setq _yPosition (float __yPosition))
   (setq _xSpeed (float __xSpeed))
   (setq _ySpeed (float __ySpeed))
   (setq _xAccel (float __xAccel))
   (setq _yAccel (float __yAccel))
   (setq _chassisAngle (float __chassisAngle))
   (setq _chassisGyro (float __chassisGyro))
   (setq _timeStamp (round __timeStamp))
   self)
  (:xPosition
   (&optional __xPosition)
   (if __xPosition (setq _xPosition __xPosition)) _xPosition)
  (:yPosition
   (&optional __yPosition)
   (if __yPosition (setq _yPosition __yPosition)) _yPosition)
  (:xSpeed
   (&optional __xSpeed)
   (if __xSpeed (setq _xSpeed __xSpeed)) _xSpeed)
  (:ySpeed
   (&optional __ySpeed)
   (if __ySpeed (setq _ySpeed __ySpeed)) _ySpeed)
  (:xAccel
   (&optional __xAccel)
   (if __xAccel (setq _xAccel __xAccel)) _xAccel)
  (:yAccel
   (&optional __yAccel)
   (if __yAccel (setq _yAccel __yAccel)) _yAccel)
  (:chassisAngle
   (&optional __chassisAngle)
   (if __chassisAngle (setq _chassisAngle __chassisAngle)) _chassisAngle)
  (:chassisGyro
   (&optional __chassisGyro)
   (if __chassisGyro (setq _chassisGyro __chassisGyro)) _chassisGyro)
  (:timeStamp
   (&optional __timeStamp)
   (if __timeStamp (setq _timeStamp __timeStamp)) _timeStamp)
  (:serialization-length
   ()
   (+
    ;; float32 _xPosition
    4
    ;; float32 _yPosition
    4
    ;; float32 _xSpeed
    4
    ;; float32 _ySpeed
    4
    ;; float32 _xAccel
    4
    ;; float32 _yAccel
    4
    ;; float32 _chassisAngle
    4
    ;; float32 _chassisGyro
    4
    ;; uint32 _timeStamp
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _xPosition
       (sys::poke _xPosition (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yPosition
       (sys::poke _yPosition (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _xSpeed
       (sys::poke _xSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ySpeed
       (sys::poke _ySpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _xAccel
       (sys::poke _xAccel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yAccel
       (sys::poke _yAccel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _chassisAngle
       (sys::poke _chassisAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _chassisGyro
       (sys::poke _chassisGyro (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _timeStamp
       (write-long _timeStamp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _xPosition
     (setq _xPosition (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yPosition
     (setq _yPosition (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _xSpeed
     (setq _xSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ySpeed
     (setq _ySpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _xAccel
     (setq _xAccel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yAccel
     (setq _yAccel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _chassisAngle
     (setq _chassisAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _chassisGyro
     (setq _chassisGyro (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _timeStamp
     (setq _timeStamp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_communication::localizationInfoBroadcast :md5sum-) "93de7300af4a3e98ca0a4ec3c9466b01")
(setf (get robot_communication::localizationInfoBroadcast :datatype-) "robot_communication/localizationInfoBroadcast")
(setf (get robot_communication::localizationInfoBroadcast :definition-)
      "# 定位消息广播需要数据
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


")



(provide :robot_communication/localizationInfoBroadcast "93de7300af4a3e98ca0a4ec3c9466b01")


