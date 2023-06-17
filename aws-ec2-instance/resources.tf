resource "aws_instance" "aws-ec2-machine-first" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "my-first-aws-instance-using-terraform"
  }
}
