#!/bin/bash

NOWDATETIME=`date +%Y%m%d_%H%M%S`


HOST_IP="192.168.1.117"
CAM_1="/dev/video0"
CAM_2="/dev/video1"
CAM_3="/dev/video2"


CAM_1_CAPTION="CAM 1"
CAM_2_CAPTION="CAM 2"
CAM_3_CAPTION="CAM 3"

OUTPUT_FILE_CAM_1="output_video_cam1_$NOWDATETIME.mp4"
OUTPUT_FILE_CAM_2="output_video_cam2_$NOWDATETIME.mp4"
OUTPUT_FILE_CAM_3="output_video_cam3_$NOWDATETIME.mp4"


gst-launch-1.0 -v --gst-debug-level=1 v4l2src device=/dev/video0 \
! timeoverlay halignment=right valignment=bottom text="\""$CAM_1_CAPTION"\"" shaded-background=true font-desc="Sans, 24" \
! tee name=t1 t1. ! queue ! videoscale ! video/x-raw,width=800,height=600,framerate=30/1 ! videoconvert \
! omxh264enc target-bitrate=1200000 control-rate=variable ! 'video/x-h264,profile=high' ! h264parse ! flvmux \
! filesink location=$OUTPUT_FILE_CAM_1  t1. ! queue ! videoscale \
! video/x-raw,width=320,height=240,framerate=30/1 ! videoconvert \
! omxh264enc target-bitrate=1200000 control-rate=variable ! 'video/x-h264,profile=high' ! h264parse ! flvmux \
! tcpserversink host=$HOST_IP port=9000 v4l2src device=/dev/video1 \
! timeoverlay halignment=right valignment=bottom text="\""$CAM_2_CAPTION"\"" shaded-background=true font-desc="Sans, 24" \
! tee name=t2 t2. ! queue ! videoscale ! video/x-raw,width=800,height=600,framerate=30/1 ! videoconvert \
! omxh264enc target-bitrate=1200000 control-rate=variable ! 'video/x-h264,profile=high' ! h264parse ! flvmux \
! filesink location=$OUTPUT_FILE_CAM_2  t2. ! queue ! videoscale \
! video/x-raw,width=320,height=240,framerate=30/1 ! videoconvert \
! omxh264enc target-bitrate=1200000 control-rate=variable ! 'video/x-h264,profile=high' ! h264parse ! flvmux \
! tcpserversink host=$HOST_IP port=9001 v4l2src device=/dev/video2 \
! timeoverlay halignment=right valignment=bottom text="\""$CAM_3_CAPTION"\"" shaded-background=true font-desc="Sans, 24" \
! tee name=t3 t3. ! queue ! videoscale ! video/x-raw,width=800,height=600,framerate=30/1 ! videoconvert \
! omxh264enc target-bitrate=1200000 control-rate=variable ! 'video/x-h264,profile=high' ! h264parse ! flvmux \
! filesink location=$OUTPUT_FILE_CAM_3  t3. ! queue ! videoscale \
! video/x-raw,width=320,height=240,framerate=30/1 ! videoconvert \
! omxh264enc target-bitrate=1200000 control-rate=variable ! 'video/x-h264,profile=high' ! h264parse ! flvmux \
! tcpserversink host=$HOST_IP port=9002 

