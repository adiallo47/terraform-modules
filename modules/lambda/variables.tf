variable "zipfilepath" {
    description = "zip file path"
    type = string
    # default = "./src/lambda.zip"
}

variable "lambdarole" {
    description = "lambda role arn"
    type = string
}

variable "runtime" {
    description = "lambda runtime"
    default = "python3.9"
    type = string
}

variable "handler" {
    description = "lambda handler"
    default = "stop-startEC2.lambda_handler"
    type = string
}

variable name {
    description = "name of ec2 instance"
    default = "turnoff_EC2"
    type = string
}