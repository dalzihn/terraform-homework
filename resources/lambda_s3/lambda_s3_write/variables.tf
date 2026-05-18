variable "function_name" {
    description = "Lambda function name"
    type = string
}

variable "filename" {
    description = "Name of the file"
    type = string
}

variable "source_code_file" {
    description = "Source code of the Lambda function (.zip)"
    type = string 
}

variable "lambda_iam_role" {
    description = "IAM role ARN for Lambda function"
    type = string 
}

variable "runtime" {
    description = "Lambda runtime"
    type = string
}