module "lambda_s3" {
    source = "../../../modules/lambda_s3"
    function_name = var.function_name
    filename = var.filename
    source_code_file =  var.source_code_file
    lambda_iam_role = var.lambda_iam_role
    runtime = var.runtime
    # lambda_environment_variables = var.lambda_environment_variables
}

# resource "aws_lambda_permission" "s3" {
#     statement_id = "AllowS3"
#     action = "lambda:InvokeFunction"
#     function_name =  module.lambda_s3.lambda_function_name
#     principal = "s3.amazonaws.com"
#     source_arn = module.s3_bucket.bucket_arn
# }

# resource "aws_s3_bucket_notification" "trigger" {
#     bucket = module.s3_bucket.bucket_id

#     lambda_function {
#         lambda_function_arn = module.lambda_s3.lambda_arn
#         events = ["s3:ObjectCreated:*"]
#     }

#     depends_on = [aws_lambda_permission.s3]
# }