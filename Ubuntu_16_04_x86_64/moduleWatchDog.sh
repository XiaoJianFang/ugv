#!/bin/sh

# gnome-terminal --hide-menubar --geometry=833x10+85+20

resize -c -s 11 40

echo "Waiting for modules... ..."

while [ true ]; do

	sleep 2

	echo "---------------------------------"

	count=`ps -ef | grep CAN_interface | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
	 echo "\033[32m[CAN]		Started!\033[0m	|" 
	else
	 echo "\033[31m[CAN]		Fail!\033[0m     	|" 
	fi


	count=`ps -ef | grep LidarDriverVector | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
	 echo "\033[32m[Lidar]		Started!\033[0m	|" 
	else
	 echo "\033[31m[Lidar]		Fail!\033[0m     	|"
	fi


	count=`ps -ef | grep GPS982 | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
	 echo "\033[32m[GPS]		Started!\033[0m	|" 
	else
	 echo "\033[31m[GPS]		Fail!\033[0m     	|"
	fi


	count=`ps -ef | grep VSLAM | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
	 echo "\033[32m[VSLAM]		Started!\033[0m	|" 
	else
	 echo "\033[31m[VSLAM]		Fail!\033[0m     	|"
	fi


	count=`ps -ef | grep Planner | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
	 echo "\033[32m[Plan]		Started!\033[0m	|" 
	else
	 echo "\033[31m[Plan]		Fail!\033[0m     	|"
	fi


	count=`ps -ef | grep Fusion2017_ubuntu_x86_64_Newplan | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
	 echo "\033[32m[Fusion]	Started!\033[0m	|" 
	else
	 echo "\033[31m[Fusion]	Fail!\033[0m     	|"
	fi


	count=`ps -ef | grep SendMap | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
	 echo "\033[32m[Map]		Started!\033[0m	|" 
	else
	 echo "\033[31m[Map]		Fail!\033[0m     	|"
	fi


	count=`ps -ef | grep Control | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
	 echo "\033[32m[Control]	Started!\033[0m	|" 
	else
	 echo "\033[31m[Control]	Fail!\033[0m     	|"
	fi

	echo "---------------------------------"


done


