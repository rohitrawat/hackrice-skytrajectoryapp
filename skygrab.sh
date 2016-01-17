#!/bin/bash

if [ $# -lt 2 ]
then
  echo "Usage:"
  echo "$0 lattitude logitude [name]"
  exit
fi

LAT=$1
LON=$2
NAME=$3

# stellarium --longitude 77.2090 --lattitide 28.6139 --fov 180 &
#echo stellarium --longitude $LON --lattitide $LAT --fov 180 &
#stellarium --longitude $LON --lattitide $LAT --fov 180 &

sed -e "s/LATTITUDE/$LAT/g" in.ssc | sed -e "s/LONGITUDE/$LON/g" | sed -e "s/NAME/$NAME/g" > out.ssc
# cat out.ssc
stellarium --startup-script $PWD/out.ssc &> /dev/null &
sleep 4;
gnome-screenshot -f sky.png
pkill stellarium

