module "lambda_s3" {
    source = "../../../modules/lambda_s3"
    function_name = var.function_name
    filename = var.filename
    source_code_file =  var.source_code_file
    lambda_iam_role = var.lambda_iam_role
    runtime = var.runtime
    # lambda_environment_variables = var.lambda_environment_variables
}
