;; Auto-generated. Do not edit!


(when (boundp 'robot_communication::goal)
  (if (not (find-package "ROBOT_COMMUNICATION"))
    (make-package "ROBOT_COMMUNICATION"))
  (shadow 'goal (find-package "ROBOT_COMMUNICATION")))
(unless (find-package "ROBOT_COMMUNICATION::GOAL")
  (make-package "ROBOT_COMMUNICATION::GOAL"))

(in-package "ROS")
;;//! \htmlinclude goal.msg.html


(defclass robot_communication::goal
  :super ros::object
  :slots (_Position_x _Position_y _Position_yaw ))

(defmethod robot_communication::goal
  (:init
   (&key
    ((:Position_x __Position_x) 0.0)
    ((:Position_y __Position_y) 0.0)
    ((:Position_yaw __Position_yaw) 0.0)
    )
   (send-super :init)
   (setq _Position_x (float __Position_x))
   (setq _Position_y (float __Position_y))
   (setq _Position_yaw (float __Position_yaw))
   self)
  (:Position_x
   (&optional __Position_x)
   (if __Position_x (setq _Position_x __Position_x)) _Position_x)
  (:Position_y
   (&optional __Position_y)
   (if __Position_y (setq _Position_y __Position_y)) _Position_y)
  (:Position_yaw
   (&optional __Position_yaw)
   (if __Position_yaw (setq _Position_yaw __Position_yaw)) _Position_yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _Position_x
    4
    ;; float32 _Position_y
    4
    ;; float32 _Position_yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Position_x
       (sys::poke _Position_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_y
       (sys::poke _Position_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_yaw
       (sys::poke _Position_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Position_x
     (setq _Position_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_y
     (setq _Position_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_yaw
     (setq _Position_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_communication::goal :md5sum-) "529b653ff7a616d53e93e8d91f1e84eb")
(setf (get robot_communication::goal :datatype-) "robot_communication/goal")
(setf (get robot_communication::goal :definition-)
      "# 目标点信息
# x位置信息
float32 Position_x
# y位置信息
float32 Position_y
# yaw轴角度信息
float32 Position_yaw
")



(provide :robot_communication/goal "529b653ff7a616d53e93e8d91f1e84eb")


