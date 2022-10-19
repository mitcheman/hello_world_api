resource "aws_apigatewayv2_api" "hello_world" {
  name          = "hello_world"
  protocol_type = "HTTP"

tags = {
    Terraform   = "true"
    Environment = var.AWS_ENVIRONMENT
  }
}

resource "aws_apigatewayv2_integration" "hello_world" {
  api_id           = aws_apigatewayv2_api.hello_world.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  description               = "hello world api test"
  integration_method        = "POST"
  integration_uri           = aws_lambda_function.hello_world.invoke_arn
}

resource "aws_apigatewayv2_stage" "hello_world_api_v1" {
  api_id      = aws_apigatewayv2_api.hello_world.id
  name        = "v1"
  auto_deploy = true

  tags = {
    Terraform   = "true"
    Environment = var.AWS_ENVIRONMENT
  }
}

resource "aws_apigatewayv2_route" "hello_world_get_route" {
  api_id    = aws_apigatewayv2_api.hello_world.id
  route_key = "GET /helloworld"
  target    = "integrations/${aws_apigatewayv2_integration.hello_world.id}"
}

resource "aws_lambda_permission" "lambda_permission" {
  action        = "lambda:InvokeFunction"
  function_name = "helloworld"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.hello_world.execution_arn}/*/*/*"
}