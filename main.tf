terraform {
  required_providers {
   aws = {
     source = "hashicorp/aws"
     version = "~> 4.16"
    }
  }
   required_version = ">= 1.2.0"
}
provider "aws" {
   region = "us-east-1"
}
resource "aws_security_group" "ssh_access" {
name   = "allow-ssh"
description = "Allow SSH inbound traffic"

  ingress {
      description = "SSH"
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
}
egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_instance" "ubuntu_ec2" {
   ami   = "ami-053b0d53c279acc90"
   instance_type = "t2.micro"
   key_name = "ansible-key"
   security_groups = [
    aws_security_group.ssh_access.name
]

   tags = {
     Name = "Terraform-Ubuntu-instance"
    }
  }
 

