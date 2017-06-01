#!/bin/bash
# Update a deployed EC2 instance

echo "-- Updating packages and installing emacs"
yum update -y
yum install emacs -y

echo "-- Checking CodeDeploy agent"
if service --status-all | grep -q codedeploy-agent; then
    echo "---- CodeDeploy agent is running"
else
    echo "---- Installing CodeDeploy agent on $instanceId ($dnsName)"
    wget https://aws-codedeploy-us-west-2.s3.amazonaws.com/latest/install && chmod +x install && sudo ./install auto && rm install
    agentStatus=$( service codedeploy-agent status )
    if [[ ! "$agentStatus" =~ "agent is running" ]]; then
	echo "---- Failed to install CodeDeploy agent, please install manually"
	exit 1
    fi
fi

echo "-- Checking Java version"
if java -version 2>&1 | head -n 1 | grep -q 1.7; then
    echo "-- Installing Java 8, removing Java 7, and setting Java 8 to default"
    yum -y install java-1.8.0 && sudo yum -y remove java-1.7.0-openjdk && sudo /usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
fi
