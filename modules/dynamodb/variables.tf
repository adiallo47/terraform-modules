variable region {
    description = "region"
    default = "us-east-1"
    type = string
}
variable name {
    description = "name"
    default = "tf-dou-dynamodb"
    type = string
}
variable hash_key {
    description = "hash_key"
    default = "HashKey"
    type = string
}
variable range_key {
    description = "range_key"
    default = "RangeKey"
    type = string
}
variable tag{
    description = "tag"
    default = "Terraform practice"
    type = string
}