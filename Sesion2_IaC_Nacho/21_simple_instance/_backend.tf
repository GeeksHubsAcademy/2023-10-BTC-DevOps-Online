terraform {
  backend "s3" {
    bucket         = "terraform-devops-dev"
    key            = "nacho/ejercicio_1.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform_state_locking-devops-dev"
  }
}
