terraform {
  required_version = ">=1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }

  backend "s3" {
    bucket         = "tfstate-tf"
    region         = "ap-south-1"
    key            = "terraform.tfstate"
    dynamodb_table = "tfstate-tf-lock"
  }
}

# aws authorization
variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

resource "aws_instance" "aws_ec2_instance" {
  ami           = "ami-0eb22e4d8a8d4fde8"
  instance_type = "t2.micro"

  tags = {
    Name = "my-ec2-instance"
  }
}
