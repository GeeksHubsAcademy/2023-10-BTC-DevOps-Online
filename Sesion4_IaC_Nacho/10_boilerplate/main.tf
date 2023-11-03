data "aws_ami" "bitnami_nginx" {
  most_recent = true
  owners      = ["979382823631"] # Bitnami

  filter {
    name   = "name"
    values = ["bitnami-nginx-1.23.3-7*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.bitnami_nginx.id
  instance_type               = "t3.micro"
  subnet_id                   = data.aws_subnet.selected.id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    data.aws_security_group.allow_traffic.id,
    data.aws_security_group.allow_ssh.id,
    data.aws_security_group.allow_outbound.id
  ]

  tags = {
    Name = "web_server"
  }
}
