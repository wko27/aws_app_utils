# aws_app_utils
Helpful tools for quickly creating/prototyping simple applications on AWS

### Installation
* Install the AWS Command Line Interface
  * `brew install awscli`
* Clone this repository
* Add the following to your ~/.bash_profile
  * `export PATH=(full path to bin directory):$PATH`
  * Note this should be a full path (do not use ~)
  * For example, if I cloned this repository to /Users/bob/repos/aws_app_utils, then I would add this line `export PATH=/Users/bob/repos/aws_app_utils/bin:$PATH`

### Configuration
* newApp creates a new app project with the following default directory structure
  * services will contain directories which correspond to services/tasks
  * each service directory contains
    * aws.properties file
    * aws.codedeploy directory

### Usage

* Run `newApplication` (and follow the prompts) to create a new application
* Run `newService` (and follow the prompts) to create a new service
  * create an auto scaling group
  * create a security group
  * create a code deploy group
  * create a a deployment application
  * create one EC2 instance
* Run `deployService (service)` to deploy code to your service
* Run `sshaws (service)` to ssh into that EC2 instance
* Run `deleteService (service)` to delete all resources configured for this service
* Run `deleteApplication (application)` to delete all resources for an application
