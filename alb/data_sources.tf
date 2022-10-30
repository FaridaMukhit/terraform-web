data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "aws-session-may2022-backend-farida"
    region = "us-east-1"
    key    = "vpc/backend/terraform.tfstate"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "aws-session-may2022-backend-farida"
    region = "us-east-1"
    key    = "ALB/dev/terraform.tfstate"
  }
}
