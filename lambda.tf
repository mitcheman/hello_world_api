
resource "aws_lambda_function" "hello_world_lambda_function" {

  s3_bucket     = aws_s3_bucket.hello_world_bucket.id
  s3_key        = aws_s3_bucket.hello_world_key.key
  function_name = "helloworld"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "function.handler"
  runtime       = "nodejs16.x"
}