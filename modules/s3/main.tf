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

# S3 bucket name
resource "aws_s3_bucket" "s3bucket" {
  bucket = var.s3bucket

  tags = {
    name = var.name
    environment = "dev"
  }
}

resource "aws_s3_bucket_acl" "s3bucket" {
  
  bucket = aws_s3_bucket.s3bucket.id
  acl = var.acl
}

resource "aws_s3_bucket_versioning" "s3bucket" {
  bucket = aws_s3_bucket.s3bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}
#--------------------------------#
#   server side encryption
#--------------------------------#
resource "aws_s3_bucket_server_side_encryption_configuration" "s3bucket" {
  bucket = aws_s3_bucket.s3bucket.id

  rule {
    apply_server_side_encryption_by_default { 
      sse_algorithm = var.sse_algorithm 
    }

  }
}

#--------------------------------#
# Output the instance details
output "s3" {
  value = aws_s3_bucket.s3bucket.id    
}