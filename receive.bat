gst-launch-1.0 tcpclientsrc host=192.168.1.117 port=9000 ! flvdemux ! decodebin ! autovideosink  tcpclientsrc host=192.168.1.117 port=9001 ! flvdemux ! decodebin ! autovideosink tcpclientsrc host=192.168.1.117 port=9002 ! flvdemux ! decodebin ! autovideosink




