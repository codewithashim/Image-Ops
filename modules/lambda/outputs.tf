output "lambda_function_arn" {
    value = aws_lambda_function.example_lambda.arn
    description = "The ARN of the created Lambda function"
}