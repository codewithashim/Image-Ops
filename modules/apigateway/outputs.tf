output "api_gateway_endpoint" {
  value       = "${aws_api_gateway_deployment.example_deployment.invoke_url}v1/upload"
  description = "API Gateway URL"
}
