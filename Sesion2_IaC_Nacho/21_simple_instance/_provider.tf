provider "aws" {
  region = "eu-west-3"

  default_tags {
    tags = {
      Account     = "GeeksHubs"
      Environment = "sandbox"
      Owner       = "Nacho"
      terraform   = "true"
    }
  }
}
