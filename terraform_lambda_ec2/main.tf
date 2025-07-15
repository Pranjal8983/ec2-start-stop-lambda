
module "iam_role" {
  source    = "./modules/iam_role"
  role_name = "lambda-ec2-fullaccess-role"
}

module "lambda_function" {
  source        = "./modules/lambda_function"
  function_name = "ec2-control-function"
  role_arn      = module.iam_role.iam_role_arn
}
