variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "ami" {
  type = string
}

variable "inbound_ports" {
  type = list(object({
    description = string,
    port        = number
  }))

  default = [{
    description = "SSH"
    port        = 22
    }, {
    description = "HTTP"
    port        = 80
    }, {
    description = "HTTPS"
    port        = 443
    }, {
    description = "MYSQL/Aurora"
    port        = 3306
  }]
}
