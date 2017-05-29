#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error when substituting.

cd /home/ec2-user
if [[ -e service/stop.sh ]]; then
    echo "Executing stop script"
    
    # This can fail on the first deployment when we don't have permissions on the files yet
    set +e
    chmod +x service/*.sh
    set -e
    
    # If stopping the service fails, then attempt to continue
    set +e
    ./service/stop.sh
    set -e

    # Give the service a few seconds to stop gracefully
    sleep 5
    
    set +e
    pkill -f '/bin/bash ./service/start.sh'
    set -e
    
    echo "Service stopped"
else
    echo "No stop script found"
fi
