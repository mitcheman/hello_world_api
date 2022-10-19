
resource "aws_lambda_function" "hello_world_lambda_function" {

  filename      = "helloworld.zip"
  function_name = "helloworld"
  role          = aws_iam_role.role_for_lambda.arn
  handler       = "index.handler"
  runtime       = "nodejs16.x"
}