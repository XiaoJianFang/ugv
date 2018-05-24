

  
  一.系统启动流程
  
  在Bin_Dominator2017里面运行./start.sh 系统启动 运行./stop.sh系统结束运行
  
  ./start.sh实际启动了./CAN_interface ./GPS982 ./Plan ./Fusion ./SendMap ./Control ./VSLAM
  
  
  二.依赖库
  libopencv*.so liblcm.so libCommonApi.so libConfig.so libGeoBasic.so libIDSDrive.so libVisualization.so libcontrolcan.so libPangolin.so libCholmod.so libBoost.so libg2o.so libDBoW2.so libgsl libgflags libgoogle-glog

  ./OpenCamera_ubuntu_x86_64 --flagfile=rightcamera.flags