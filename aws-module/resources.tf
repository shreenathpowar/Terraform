module "my-ec2-instance" {
  source               = "./modules/aws-ec2-ssh-sg"
  ami_owner_account_id = var.ami_owner_account_id
  instance_name        = var.instance_name
  image_name           = var.image_name
  instance_type        = var.instance_type
  root-device-type     = var.root-device-type
  virtualization-type  = var.virtualization-type
  key_name             = var.key_name
  key                  = file("${path.module}/id_rsa.pub")
  sg_name              = var.sg_name
  inbound_ports        = var.inbound_ports
}
