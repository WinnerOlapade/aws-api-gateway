# aws-api-gateway
### **Building Serverless REST API using AWS Lambda to POST and GET items in a DynamoDB Table with Infrastructure as Code (Terraform)**
Creating REST API in AWS using AWS API Gateway, Lambda and DynamoDB. This task (Infrastructure) was created using Terraform to allow easy deployment and management of resources in Cloud environment.

### **Folder structure**
* aws-api-task
    * main.tf 
    * get_function.zip
    * post_function.zip
    * variables.tf

The Terraform folder [_aws-api-task_](/aws-api-gateway) contains 2 archived files needed in the Terraform configuration file _main.tf_. The _variables.tf_ file contains all the variables needed in the configuration file _main.tf_. The _main.tf_ contains all the resources that will be deployed into AWS by Terraform when executed with `terraform apply` and then a subsequent "yes" approval when prompted.

Executing the terraform file: 
- creates a DynamoDB Table named "users", 
- creates 2 Lambda functions (GET and POST), 
- creates a IAM role with DynamoDB permissions and attaches the role to the lambda functions, 
- creates a REST API Gateway with name "userManagement", 
- creates 2 API Gateway methods (GET and POST) and integrates the lambda functions to the corresponding API gateway methods. 
- It also gives API permission to invoke the Lambda functions and, 
- finally deploys the API getting back the output of GET and POST method urls required for making API calls.

POST GET METHOD
API POST Method URL: "https://ycd6tuk2df.execute-api.us-east-1.amazonaws.com/v1/users"

example body:

'{"first_name":"John", "age":"32"}'
Invocation

curl -X POST -H "Content-Type: application/json" -d '{"first_name":"John", "age":"32"}' https://ycd6tuk2df.execute-api.us-east-1.amazonaws.com/v1/users
API GET METHOD
API GET Method URL: "https://ycd6tuk2df.execute-api.us-east-1.amazonaws.com/v1/{user_id}"

To make a GET Request simply click link or copy and paste link in browser and edit {user_id} with "user id" from making a POST Request or random id (will return error) .