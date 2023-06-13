// Print the  exact path of GET and POST,
output "get_url" {
  value = "${aws_api_gateway_stage.api_stage.invoke_url}/{user_id}"
}

output "post_url" {
  value = "${aws_api_gateway_stage.api_stage.invoke_url}/users"

}

output "delete_url" {
  value = "${aws_api_gateway_stage.api_stage.invoke_url}/{user_id}"
}

output "scan_url" {
  value = "${aws_api_gateway_stage.api_stage.invoke_url}/allusers"
}