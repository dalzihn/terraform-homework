variable "filename" {
    description = "Name of the Lambda function file"
    type = string
}

variable "function_name" {
    description = "Lambda function name"
    type = string
}

variable "lambda_iam_role" {
    description = "IAM role for the lambda function"
    type = string
    # default = "python3.11"
}

variable "source_code_file" {
    description = "Zip file for Lambda source code"
    type = string
}

variable "runtime" {
    description = "Runtime for Lambda function"
    type = string
}