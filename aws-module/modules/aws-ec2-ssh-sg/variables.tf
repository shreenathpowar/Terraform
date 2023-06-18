# ami data
variable "ami_owner_account_id" {
  type = string
}

# instance data
variable "instance_name" {
  type = string
}

variable "image_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "root-device-type" {
  type = string
}

variable "virtualization-type" {
  type = string
}

# key data
variable "key_name" {
  type = string
}

variable "key" {
  type = string
}

# sg data
variable "sg_name" {
  type = string
}

variable "inbound_ports" {
  type = list(object({
    description = string,
    port        = number
  }))
}
