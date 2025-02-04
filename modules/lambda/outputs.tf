output "lambda_function_name" {
  value = aws_lambda_function.EC2_control.function_name # lambda name
}

output "lambda_function_arn" {
  value = aws_lambda_function.EC2_control.arn #lambda address
}