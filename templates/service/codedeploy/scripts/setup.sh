#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error when substituting.

echo "-- Checking Java version"
if java -version 2>&1 | head -n 1 | grep -q '"1.7'; then
    echo "-- Detected Java 7 runtime, aborting!  Fix manually!!"
    exit 1
fi

cd /home/ec2-user

echo "-- Modifying permissions on files (excluding appspec.xml and scripts directory)"
find service -not -path "./scripts/*" -not -path "./appspec.xml" -not -path "./scripts" -print0 | xargs -0 chown -R ec2-user:ec2-user
