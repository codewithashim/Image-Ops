variable "function_name" {
    type = string
    description = "Name of the lambda function"
}
variable "runtime" {
    type = string
    description = "runtime for the lambda function"
}
variable "handler" {
    type = string
    description = "handler for lambda function"
}
variable "role" {
    type = string
    description = "IAM role ARN for lambda function"
}
variable "memory_size" {
    type = number
    description = "memory size of the lambda function in MB"
}
variable "timeout" {
    type = number
    description = "timeout of the lambda function in seconds"
}
variable "code_path" {
    type = string
    description = "code location of the lambda function"
}
 variable "environment" {
  type = map(string)
  description = "Environment variables"
   default = {}
}