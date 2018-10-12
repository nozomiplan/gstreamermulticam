#!/bin/bash


HOST_IP="192.168.1.117" #Host IP address must be Raspberry Pi side



gst-launch-1.0 tcpclientsrc host=$HOST_IP port=9000 ! flvdemux ! decodebin \
! autovideosink  tcpclientsrc host=$HOST_IP port=9001 ! flvdemux ! decodebin \
! autovideosink tcpclientsrc host=$HOST_IP port=9002 ! flvdemux ! decodebin ! autovideosink

