// Print the  exact path of GET and POST,
output "get_url" {
  description = "URL for get api"
  value = "${aws_api_gateway_stage.api_stage.invoke_url}/{user_id}"
}

output "post_url" {
  description = "URL for post api"
  value = "${aws_api_gateway_stage.api_stage.invoke_url}/users"
}

output "delete_url" {
  description = "URL for delete api"
  value = "${aws_api_gateway_stage.api_stage.invoke_url}/{user_id}"
}

output "scan_url" {
  description = "URL for scan api"
  value = "${aws_api_gateway_stage.api_stage.invoke_url}/allusers"
}