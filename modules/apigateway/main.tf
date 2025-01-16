resource "aws_api_gateway_rest_api" "example_api" {
    name = var.api_name
    description = "API Gateway for image processing"
}


resource "aws_api_gateway_resource" "example_resource" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  parent_id = aws_api_gateway_rest_api.example_api.root_resource_id
  path_part = "upload" # Route you want to expose
}


resource "aws_api_gateway_method" "example_method" {
  rest_api_id   = aws_api_gateway_rest_api.example_api.id
  resource_id   = aws_api_gateway_resource.example_resource.id
  http_method   = "POST"
  authorization = "NONE" # Adjust this for security

}



resource "aws_api_gateway_integration" "example_integration" {
  rest_api_id             = aws_api_gateway_rest_api.example_api.id
  resource_id             = aws_api_gateway_resource.example_resource.id
  http_method             = aws_api_gateway_method.example_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri = var.lambda_function_arn

}

resource "aws_api_gateway_deployment" "example_deployment" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  # trigger is needed here or it will not be updated automatically
   triggers = {
     redeployment = sha1(jsonencode([
        aws_api_gateway_rest_api.example_api.body,
      aws_api_gateway_resource.example_resource.id,
      aws_api_gateway_method.example_method.id,
       aws_api_gateway_integration.example_integration.id,
    ]))
  }
  lifecycle {
       create_before_destroy = true
    }

  depends_on = [
    aws_api_gateway_integration.example_integration
  ]
}

resource "aws_api_gateway_stage" "example_stage" {
    deployment_id = aws_api_gateway_deployment.example_deployment.id
    rest_api_id   = aws_api_gateway_rest_api.example_api.id
    stage_name    = "v1"
}