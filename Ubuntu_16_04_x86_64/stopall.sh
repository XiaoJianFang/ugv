#!/bin/sh

ps -ef | grep Control | grep -v grep | cut -c 9-15 | xargs kill -s 9

ps -ef | grep Fusion2017 | grep -v grep | cut -c 9-15 | xargs kill -s 9

ps -ef | grep Planner | grep -v grep | cut -c 9-15 | xargs kill -s 9

ps -ef | grep SendMap | grep -v grep | cut -c 9-15 | xargs kill -s 9

ps -ef | grep CAN_interface | grep -v grep | cut -c 9-15 | xargs kill -s 9

ps -ef | grep GPS982 | grep -v grep | cut -c 9-15 | xargs kill -s 9

ps -ef | grep LidarDriverVector | grep -v grep | cut -c 9-15 | xargs kill -s 9

ps -ef | grep RSDS_MBE | grep -v grep | cut -c 9-15 | xargs kill -s 9
 # ps -ef | grep VSLAM | grep -v grep | cut -c 9-15 | xargs kill -s 9



