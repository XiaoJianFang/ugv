#!/bin/sh

rm -rf lcmtypes

lcm-gen -j *.lcm

javac -cp lcm.jar lcmtypes/*.java

jar cf ControlType.jar lcmtypes/*.class
