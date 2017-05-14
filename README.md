# aws_app_utils
Helpful utilities for creating applications on AWS

### Configuration
* Create an aws.properties file for each service (see the template)
* Create an aws.codedeploy directory for each service (see the template)

### Usage
* Run `configure (service)/aws.properties` to
  * create an auto scaling group
  * create a security group
  * create a code deploy group
  * create a a deployment application
  * create one EC2 instance
* Run `deploy (build dir) (service)/aws.properties` to deploy the code to your service
* Run `sshaws (service)/aws.properties` to ssh into that EC2 instance
* Run `delete (service)/aws.properties` to delete all resources configured for this service
