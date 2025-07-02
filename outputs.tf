output "instance_public_ip" {
  value = aws_instance.ubuntu_ec2.public_ip
}
