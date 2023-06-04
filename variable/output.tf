// we can define two files
// from one file we can take variable
// in second file we can output its value

// var.username will be taken from variable.tf file

// will print var.username as it is
output "output-username-string" {
  value = "hello var.username"
}

// will print given username
output "output-username" {
  value = var.username
}

// will print given username in string after hello
output "output-username-string-var" {
  value = "hello ${var.username}"
}
