resource "aws_instance" "aws-ec2-machine-first" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "my-first-aws-instance-using-terraform"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

  # file Provisioner
  # copy files
  provisioner "file" {
    source      = "README.md"
    destination = "/tmp/REAMDE.md"
  }

  # copy files from folder
  provisioner "file" {
    source      = "data/"
    destination = "/tmp/"
  }

  # local-exec provisioner
  provisioner "local-exec" {
    command     = "import os; print(os.getenv('apps_path'))"
    interpreter = ["C:/Python311/python", "-c"]
    working_dir = "C:/apps/"
    environment = {
      apps_path = "C:/apps/"
    }
  }

  # remote-exec provisioner - inline
  provisioner "remote-exec" {
    inline = [
      "#!/bin/bash",
      "set -o errexit",
      "sudo mkdir -p /apps/data",
      "sudo chmod 777 /apps/data/",
      "sudo echo 'hello world' > /apps/data/data.txt"
    ]
  }

  # remote-exec provisioner - script
  provisioner "remote-exec" {
    # where does this script runs?
    script = "remote-scripts/print-hello.sh"
  }

  # remote-exec provisioner - scripts
  provisioner "remote-exec" {
    when = destroy
    scripts = [
      "remote-scripts/print-hello.sh",
      "remote-scripts/print-world.sh",
    ]
  }
}
