#----------------------------------------------------------------#
                          #stop EC2
#----------------------------------------------------------------#
#scheduler
resource "aws_cloudwatch_event_rule" "stop_ec2_schedule" {
  name                = "StopEC2Schedule"
  description         = "stop EC2 instance daily at 7PM"
  schedule_expression = "cron(0 0 * * ? *)"
}

#link scheduler to my lambda function
resource "aws_cloudwatch_event_target" "stop_lambda" {
  rule      = aws_cloudwatch_event_rule.stop_ec2_schedule.name
  arn       = var.lambda_function_arn #lambda function ~main.tf
  target_id = "StopEC2Lambda"

  input = jsonencode({
    action = "stop"
  })
}
#----------------------------------------------------------------#
                          #start EC2
#----------------------------------------------------------------#
#scheduler
resource "aws_cloudwatch_event_rule" "start_ec2_schedule" {
  name                = "StartEC2Schedule"
  description         = "start EC2 instance daily at 10AM" 
  schedule_expression = "cron(0 15 * * ? *)"
}

#link scheduler to my lambda function
resource "aws_cloudwatch_event_target" "startlambda" {
  rule      = aws_cloudwatch_event_rule.start_ec2_schedule.name
  arn       = var.lambda_function_arn #lambda function ~main.tf
  target_id = "StartEC2Lambda"

  input = jsonencode({
    action = "start"
  })
}
#----------------------------------------------------------------#
                ##permission to talk to lambda and EC2
#----------------------------------------------------------------#
resource "aws_lambda_permission" "allow_eventbridge" {
    for_each = {
        "start": aws_cloudwatch_event_rule.start_ec2_schedule.arn,
        "stop":  aws_cloudwatch_event_rule.stop_ec2_schedule.arn
    }
  statement_id  = "AllowExecutionFromEventBridge-${each.key}"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "events.amazonaws.com"
  source_arn    = each.value
}