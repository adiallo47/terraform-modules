resource "aws_lambda_function" "EC2_control" {
  function_name = var.name 
  role = var.lambdarole #iam role name
  runtime = var.runtime
  handler = var.handler
  filename = var.zipfilepath
  source_code_hash = filebase64sha256(var.zipfilepath)

environment {
    variables = {
        action = "stop"
    }
}
}