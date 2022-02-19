#!/bin/bash

cd /mounted_volume/Launcher/
if [ -f "lib_renegade_x_launcher" ]; 
then

exec ./lib_renegade_x_launcher
else

cp /usr/bin/lib_renegade_x_launcher ./
exec ./lib_renegade_x_launcher
fi