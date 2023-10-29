output "ami_name" {
  description = "Name of AMI used"
  value       = data.aws_ami.latest.name
}

output "ami_label" {
  description = "Label of AMI"
  value       = data.aws_ami.latest.description
}

output "public_ip" {
  description = "Public IP associated with EC2 instance"
  value       = aws_instance.this.public_ip
}
