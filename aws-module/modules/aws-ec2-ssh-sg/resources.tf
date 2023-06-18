data "aws_ami" "machine" {
  most_recent = true
  owners      = ["${var.ami_owner_account_id}"] # Owner account ID

  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["${var.root-device-type}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["${var.virtualization-type}"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name = var.key_name
  public_key = var.key
}

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = "Custom SG"

  dynamic "ingress" {
    for_each = var.inbound_ports
    iterator = port_description
    content {
      description = port_description.value.description
      from_port   = port_description.value.port
      to_port     = port_description.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

resource "aws_instance" "aws_ec2_instance" {
  ami                    = data.aws_ami.machine.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  tags = {
    Name = var.instance_name
  }
}
