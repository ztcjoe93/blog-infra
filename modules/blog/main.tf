# fetch latest AL2023 ARM64 image
data "aws_ami" "latest" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-arm64"]
  }

  filter {
    name   = "ena-support"
    values = [true]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data = templatefile("${path.module}/user_data.sh", {
    go_version = var.go_version
  })

  tags = {
    Name      = "twc-ec2"
    Terraform = true
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.this.id
  domain   = "vpc"

  tags = {
    Name      = "twc-eip"
    Terraform = true
  }
}
