terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Define the EC2 instance
resource "aws_instance" "myec2" {
  ami           = var.ami # Replace with your desired AMI ID
  instance_type = var.myec2

  tags = {
    name = var.name
  }
}

# Output the instance details
output "ec2" {
  value = aws_instance.myec2.id
}