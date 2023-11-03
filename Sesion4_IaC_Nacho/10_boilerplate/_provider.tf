provider "aws" {
  region = "eu-west-3"

  default_tags {
    tags = {
      Account     = "GeeksHubs"
      Environment = "sandbox"
      Owner       = "<tu_nombre>"
      terraform   = "true"
    }
  }
}
