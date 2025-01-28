variable "region" {
    description = "AWS Region"
    default = "us-east-1"
    type = string
}

variable "s3bucket" {
    description = "s3bucket"
    default = "tf-dou-s3bucket"
    type = string
}

variable "ami" {
    description = "EC2 AMI"
    default = "ami-04b4f1a9cf54c11d0"
    type = string
}

variable "name" {
    description = "s3 bucket"
    default = "Terraform practice"
    type = string
}

variable "sse_algorithm" {
    description = "server-side encryption algorithm"
    default = "AES256"
    type = string
}

variable "acl" {  
    description = "ownership of objects in the bucket"    
    default = "private"
    type = string
}