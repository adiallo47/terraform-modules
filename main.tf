module "ec2" {
    source = "./modules/ec2"
}
module "s3" {
    source = "./modules/s3"
}
module "dynamodb" {
    source = "./modules/dynamodb"
}
module "eventbridge" {
    source = "./modules/eventbridge"
    lambda_function_name = module.lambda.lambda_function_name  # Pass function_name
    lambda_function_arn  = module.lambda.lambda_function_arn   # Pass function_arn
}
module "iam" {
    source = "./modules/iam"
}
module "lambda" {
    source = "./modules/lambda"
    lambdarole = module.iam.role_arn
     zipfilepath = "./modules/lambda/src/lambda.zip"
}
