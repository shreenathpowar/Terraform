variable "username" {}

// will print var.username as it is
output "variable-username-string" {
  value = "hello var.username"
}

// will print given username
output "variable-username" {
  value = var.username
}

// will print given username in string after hello
output "variable-username-string-var" {
  value = "hello ${var.username}"
}
