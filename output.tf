output "get_api_endpoint" {
    value = "${aws_apigatewayv2_stage.hello_world_api_v1.invoke_url}/helloworld"
}