#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error when substituting.

echo "-- Removing previous install"
cd /home/ec2-user
rm -rf service

