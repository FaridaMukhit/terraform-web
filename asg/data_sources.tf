data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "userdata" {
  template = file("user_data.sh")
  vars = {
    environment = var.env
  }
}


data "aws_subnets" "subnet" {
  filter {
    name   = "vpc-id"
    values = [var.pub_subnet_cidrA, var.pub_subnet_cidrB, var.pub_subnet_cidrC, var.private_subnet_cidrA, var.private_subnet_cidrB, var.private_subnet_cidrC]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

