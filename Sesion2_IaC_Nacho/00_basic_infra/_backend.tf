terraform {
  backend "s3" {
    bucket         = "terraform-devops-dev"
    key            = "nacho/basic_infra.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform_state_locking-devops-dev"
  }
}
