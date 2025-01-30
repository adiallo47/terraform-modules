resource "aws_stop-startEC2" "EC2_control" {
  name = 
  role = 
  handler =
  runtime = "python3.9"
  filename = 
  source_code_hash = filebase64sha256(".zip")



environment {
    variables = {
        action = "stop"
    }
}
}