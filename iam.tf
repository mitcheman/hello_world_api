resource "aws_iam_role" "role_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_execution_role" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.role_for_lambda.name
}