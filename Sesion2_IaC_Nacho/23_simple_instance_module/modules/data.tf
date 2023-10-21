data "aws_vpc" "selected" {
  id = "vpc-08d597d6efa35d408"

  filter {
    name   = "tag:Name"
    values = ["GeeksHubs-DevOps"]
  }
}

data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.selected.id
}

data "aws_security_group" "allow_traffic" {
  name   = "allow-http-inbound-traffic"
  vpc_id = data.aws_vpc.selected.id
}
