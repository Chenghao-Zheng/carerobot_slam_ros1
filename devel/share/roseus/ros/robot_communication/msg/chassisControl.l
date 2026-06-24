;; Auto-generated. Do not edit!


(when (boundp 'robot_communication::chassisControl)
  (if (not (find-package "ROBOT_COMMUNICATION"))
    (make-package "ROBOT_COMMUNICATION"))
  (shadow 'chassisControl (find-package "ROBOT_COMMUNICATION")))
(unless (find-package "ROBOT_COMMUNICATION::CHASSISCONTROL")
  (make-package "ROBOT_COMMUNICATION::CHASSISCONTROL"))

(in-package "ROS")
;;//! \htmlinclude chassisControl.msg.html


(defclass robot_communication::chassisControl
  :super ros::object
  :slots (_xSpeed _ySpeed _chassisAngle _chassisGyro _timeStamp _globalOrlocal ))

(defmethod robot_communication::chassisControl
  (:init
   (&key
    ((:xSpeed __xSpeed) 0.0)
    ((:ySpeed __ySpeed) 0.0)
    ((:chassisAngle __chassisAngle) 0.0)
    ((:chassisGyro __chassisGyro) 0.0)
    ((:timeStamp __timeStamp) 0)
    ((:globalOrlocal __globalOrlocal) nil)
    )
   (send-super :init)
   (setq _xSpeed (float __xSpeed))
   (setq _ySpeed (float __ySpeed))
   (setq _chassisAngle (float __chassisAngle))
   (setq _chassisGyro (float __chassisGyro))
   (setq _timeStamp (round __timeStamp))
   (setq _globalOrlocal __globalOrlocal)
   self)
  (:xSpeed
   (&optional __xSpeed)
   (if __xSpeed (setq _xSpeed __xSpeed)) _xSpeed)
  (:ySpeed
   (&optional __ySpeed)
   (if __ySpeed (setq _ySpeed __ySpeed)) _ySpeed)
  (:chassisAngle
   (&optional __chassisAngle)
   (if __chassisAngle (setq _chassisAngle __chassisAngle)) _chassisAngle)
  (:chassisGyro
   (&optional __chassisGyro)
   (if __chassisGyro (setq _chassisGyro __chassisGyro)) _chassisGyro)
  (:timeStamp
   (&optional __timeStamp)
   (if __timeStamp (setq _timeStamp __timeStamp)) _timeStamp)
  (:globalOrlocal
   (&optional (__globalOrlocal :null))
   (if (not (eq __globalOrlocal :null)) (setq _globalOrlocal __globalOrlocal)) _globalOrlocal)
  (:serialization-length
   ()
   (+
    ;; float32 _xSpeed
    4
    ;; float32 _ySpeed
    4
    ;; float32 _chassisAngle
    4
    ;; float32 _chassisGyro
    4
    ;; uint32 _timeStamp
    4
    ;; bool _globalOrlocal
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _xSpeed
       (sys::poke _xSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ySpeed
       (sys::poke _ySpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _chassisAngle
       (sys::poke _chassisAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _chassisGyro
       (sys::poke _chassisGyro (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _timeStamp
       (write-long _timeStamp s)
     ;; bool _globalOrlocal
       (if _globalOrlocal (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _xSpeed
     (setq _xSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ySpeed
     (setq _ySpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _chassisAngle
     (setq _chassisAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _chassisGyro
     (setq _chassisGyro (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _timeStamp
     (setq _timeStamp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _globalOrlocal
     (setq _globalOrlocal (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robot_communication::chassisControl :md5sum-) "ba44848e12b315b92df95a3f875577ab")
(setf (get robot_communication::chassisControl :datatype-) "robot_communication/chassisControl")
(setf (get robot_communication::chassisControl :definition-)
      "# 导航发布的消息
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
")



(provide :robot_communication/chassisControl "ba44848e12b315b92df95a3f875577ab")


