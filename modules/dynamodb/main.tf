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
resource "aws_dynamodb_table" "dynamodb" {
  name             = var.name
  hash_key         = var.hash_key
  range_key        = var.range_key
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "HashKey"
    type = "S" #string
  }

  attribute {
    name = "RangeKey"
    type = "N" #num
  }

  tags = {
    name = var.tag
    environment = "stage"
  }
}