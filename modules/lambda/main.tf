data "archive_file" "lambda_function_zip" {
  type        = "zip"
  source_dir  = var.code_path
  output_path = "${var.function_name}_payload.zip"
}


resource "aws_lambda_function" "example_lambda" {
  function_name = var.function_name
  runtime       = var.runtime
  handler       = var.handler
  role          = var.role
  memory_size   = var.memory_size
  timeout       = var.timeout
    # The lambda function package
    filename = data.archive_file.lambda_function_zip.output_path
    environment {
      variables = var.environment
    }
}