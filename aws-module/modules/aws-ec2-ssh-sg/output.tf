output "ubuntu-ec2-public-ip" {
    value = aws_instance.aws_ec2_instance.public_ip
}
