data "aws_ami" "nacho_instance" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-nginx-1.23.3-7*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["GeeksHubs-DevOps"]
  }
}

data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.patata.id
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.nacho_instance.id
  instance_type = "t3.micro"

  subnet_id                   = data.aws_subnet.selected.id
  associate_public_ip_address = true

  tags = {
    Name = "Nacho1"
  }
}

output "my_instance_ip" {
  value = aws_instance.web.public_ip
}