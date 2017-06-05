# aws_app_utils
Helpful tools for quickly creating/prototyping simple applications on AWS

### Installation
* Clone this repository
* Add the following to your ~/.bash_profile
  * `export PATH=(full path to bin directory):$PATH`
  * Note this should be a full path (do not use ~)
  * For example, if I cloned this repository to /Users/bob/repos/aws_app_utils, then I would add this line `export PATH=/Users/bob/repos/aws_app_utils/bin:$PATH`

### Usage

* Run `aws-app create-app` (and follow the prompts) to create a new application
* Run `aws-app create-service` (and follow the prompts) to create a new service
  * create an auto scaling group
  * create a security group
  * create a code deploy group
  * create a a deployment application
  * create one EC2 instance
* Run `aws-app delete-service (service)` to deploy code to your service
* Run `aws-app ssh (service)` to ssh into that EC2 instance
* Run `aws-app delete-service` to delete all resources configured for this service
* Run `aws-app delete-app` to delete all resources for an application

### FAQ

* How to specify the build directory
  * (service directory)/aws.properties, modify the LOCAL_BULID_DIR
* Is this webscale?
  * No.
  * This is intended to be an easy bootstrap way to get simple services and lambdas running when prototyping an app
  * Please use CloudFormation or other AWS infrastructure when your app needs to become more serious
* How do I give access to other users to my services' EC2 instances?
  * Please do not share the generated .pem files.
  * (app directory)/app-aws.properties, modify the EC2_USER_PUBLIC_KEYS
* I don't like this, what else can I use?
  * Check out [awless](https://github.com/wallix/awless)
