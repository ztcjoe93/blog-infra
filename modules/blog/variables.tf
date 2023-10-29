variable "instance_type" {
  type        = string
  description = "EC2 instance type used"
}

variable "key_name" {
  type        = string
  description = "Name of keypair used for SSH connections to EC2"
}

variable "go_version" {
  type        = string
  description = "Version of golang to use to run hugo"
}
