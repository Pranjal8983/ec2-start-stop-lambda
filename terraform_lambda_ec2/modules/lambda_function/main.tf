
resource "aws_lambda_function" "ec2_lambda" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  filename      = data.archive_file.lambda_output.output_path
  source_code_hash = data.archive_file.lambda_output.output_base64sha256
}

data "archive_file" "lambda_output" {
  type        = "zip"
  output_path = "${path.module}/lambda_function.zip"

  source {
    content  = file("${path.module}/lambda_function.py")
    filename = "lambda_function.py"
  }
}
