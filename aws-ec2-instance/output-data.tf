output "ubuntu-ec2-public-ip" {
    value = aws_instance.aws-ec2-machine-first.public_ip
}
