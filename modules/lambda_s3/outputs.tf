output "lambda_function_name" {
    description = "Name of the Lambda function name"
    value = aws_lambda_function.this_lambda_function.function_name
}

output "lambda_arn" {
    description = "ARN of the lambda function"
    value = aws_lambda_function.this_lambda_function.arn
}