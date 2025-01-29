variable "region" {
    description = "AWS Region"
    default = "us-east-1"
    type = string
}

variable "s3bucket" {
    description = "s3bucket"
    default = "tf-dou-s3bucket02"
    type = string
}

variable "tag" {
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