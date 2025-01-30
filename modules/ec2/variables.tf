variable "region" {
    description = "AWS Region"
    default = "us-east-1"
    type = string
}

variable "myec2" {
    description = "EC2 Instance Type"
    default = "t2.micro"
    type = string
}

variable "ami" {
    description = "EC2 AMI"
    default = "ami-04b4f1a9cf54c11d0"
    type = string
}

variable "tag" {
    description = "EC2 Name"
    default = "Terraform practice"
    type = string
}