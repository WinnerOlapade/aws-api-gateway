# aws-api-gateway
### **Building Serverless REST API using AWS Lambda to POST and GET items in a DynamoDB Table with Infrastructure as Code (Terraform)**
Creating REST API in AWS using AWS API Gateway, Lambda and DynamoDB. This task (Infrastructure) was created using Terraform to allow easy deployment and management of resources in Cloud environment.

### **Folder structure**
* [aws-api-task](aws-api-gateway/aws_api_task/)
    * [main.tf](aws-api-gateway/aws_api_task/main.tf)
    * [get_function.zip](aws-api-gateway/aws_api_task/get_function.zip)
    * [post_function.zip](aws-api-gateway/aws_api_task/post_function.zip)
    * [variables.tf](aws-api-gateway/aws_api_task/variables.tf)

The Terraform folder [_aws-api-task_](/aws-api-gateway/aws_api_task/) contains 2 archived files (post_function.zip and get_function.zip) needed in the Terraform configuration file _main.tf_. The _variables.tf_ file also contains all the variables used in the configuration file. The _main.tf_ contains all the resources that will be deployed into AWS by Terraform when executed with `terraform apply` and then a subsequent "yes" approval when prompted.

**Deploying the terraform file**: 

`terraform init`: will initialize  the working directory by downloading the plugins required to deploy the Terraform file and initializing the backend where the state file will be stored.

`terraform fmt`: is used to reformat Terraform files to a canonical format and style using Terraform language style conventions for readability and consistency sake.

`terraform validate`: verifies the configuration file in the working directory for the syntax validity and internal consistency, including the correctness of attribute names and value types.

`terraform plan`: shows the preview of resources and changes that will be made to the infrastructure in case of deployment.

`terraform apply -auto-approve`: executes the script, previews the deployment plan and automatically deploys the resources configured in the Terraform file. That is:
- creates a DynamoDB Table named "users", 
- creates 2 Lambda functions (GET and POST), 
- creates a IAM role with DynamoDB permissions and attaches the role to the lambda functions, 
- creates a REST API Gateway with name "userManagement", 
- creates 2 API Gateway methods (GET and POST) and integrates the lambda functions to the corresponding API gateway methods. 
- It also gives API permission to invoke the Lambda functions and, 
- finally deploys the API getting back the output of GET and POST method urls required for making API calls.

`terraform destroy`: will check the state file for infrastructure state and prints out the plan to destroy the resources managed by Terraform for that particular working directory and prompt for approval.

### **POST API**
*API POST Method URL:* https://ycd6tuk2df.execute-api.us-east-1.amazonaws.com/v1/users [now deactivated]

*Example body:* `'{"first_name":"John", "age":"32"}'`

*Example Invocation:* 
```curl -X POST -H "Content-Type: application/json" -d '{"first_name":"John", "age":"32"}' https://ycd6tuk2df.execute-api.us-east-1.amazonaws.com/v1/users```

### **GET API**
*API GET Method URL:* https://ycd6tuk2df.execute-api.us-east-1.amazonaws.com/v1/{user_id} [now deactivated]

*Example userID:* 7wshfh74395985jdbf4

*Example Invocation:* https://ycd6tuk2df.execute-api.us-east-1.amazonaws.com/v1/7wshfh74395985jdbf4

To make a GET Request simply click link or copy and paste link in browser and edit {user_id} with "user id" from making a POST Request or random id (will return error) .