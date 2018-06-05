#!/bin/sh

./stopall.sh

sleep 2

# count=`ps -ef | grep moduleWatchDog | grep -v "grep" | wc -l`
# if [ $count == 0 ]; then
	gnome-terminal  "moduleWatchDog" -x bash -c "sh ./moduleWatchDog.sh;exec bash;"
# fi

./CAN_interface &

./GPS982 &

./RSDS_MBE &

sleep 1

./VSLAM &

#./Planner_Release_Linux &
./Planner_Debug_Linux &

#./Fusion2017_ubuntu_x86_64_Newplan &
./Fusion2017_ubuntu_x86_64_Newplan0524 &
./SendMap &

./Control &

while [ true ]; do
       	./LidarDriverVector &
	sleep 0.8
	count=`ps -ef | grep LidarDriverVector | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
		break
	fi
done


