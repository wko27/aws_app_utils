#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error when substituting.

cd /home/ec2-user

echo "-- Modifying permissions"
chmod +x service/*.sh

echo "-- Starting service"
# -L to log the screen output to a file
# -d -m to start a new detached process
# -S to name the screen session
screen -L -d -m -S "start.sh" ./service/start.sh
