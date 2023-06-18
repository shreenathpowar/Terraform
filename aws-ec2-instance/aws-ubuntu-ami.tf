data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Owner account ID

  filter {
    name   = "name"
    values = ["${var.image_name}"]
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
