data "archive_file" "lambda" {
    type = "zip"
    source_file = "${var.filename}.py"
    output_path = var.source_code_file
}


resource "aws_lambda_function" "this_lambda_function" {
    function_name = local.function_name
    filename = var.source_code_file
    role = data.aws_iam_role.lambda_iam_role.arn
    handler = "${var.filename}.lambda_handler"
    runtime = var.runtime

    # environment {
    #     variables = var.lambda_environment_variables
    # }

    tags = {
        name = var.function_name
    }
}