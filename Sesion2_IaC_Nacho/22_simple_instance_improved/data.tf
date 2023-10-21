data "aws_vpc" "selected" {
  id = "vpc-07a69de4c06d6cc13"

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
