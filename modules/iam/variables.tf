variable "role_name" {
    type = string
    description = "name for the role"
}

 variable "assume_role_policy" {
    type = string
    description = "policy for assume role"
}

variable "policy_arns" {
    type = list(string)
    description = "iam policy arn to be attached to role"
}