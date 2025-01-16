resource "aws_iam_role" "lambda_role" {
name = var.role_name

assume_role_policy = var.assume_role_policy

}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  count = length(var.policy_arns)
  role = aws_iam_role.lambda_role.name
  policy_arn = var.policy_arns[count.index]
}