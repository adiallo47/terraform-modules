#role
#policy
#merge role and policy together

resource "aws_iam_role" "stop_start_EC2_lambdarole" {
  name = var.nameRole

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "stop_start_EC2_lambdapolicy" {
    name = var.namePolicy
    description = "stop and start EC2 instances"

        policy = jsonencode({
            Version = "2012-10-17"
            Statement = [
            {
                Effect = "Allow"
                Action = [
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:DescribeInstances"
                ]
                Resource = var.EC2Instance_arns
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "lambdaEc2_policyattachment" {
  role       = aws_iam_role.stop_start_EC2_lambdarole.name
  policy_arn = aws_iam_policy.stop_start_EC2_lambdapolicy.arn
}