variable nameRole {
    description = "name"
    default = "stop_start_eEC2_role"
    type = string
}

variable namePolicy {
    description = "name"
    default = "stop_start_EC2_policy"
    type = string
}

variable EC2Instance_arns{
    description = "EC2 instances that lambda can communicate to"
    default = ["*"]
     type = list(string)
}