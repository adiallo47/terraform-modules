output "dynamod_table_name"{
    value = aws_dynamodb_table.dynamodb.name
    description = "dynamodb table name"
}
output "dynamodb_table_billing_mode" {
    value = aws_dynamodb_table.dynamodb.billing_mode
    description = "billing mode"
}
output "dynamodb_table_id" {
    value = aws_dynamodb_table.dynamodb.id
    description = "ID of the table"
}