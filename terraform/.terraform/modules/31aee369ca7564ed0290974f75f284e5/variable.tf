# Variables

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-2"
}
variable "vpc_id" {
  description = "VPC id"
  default = ""
}
variable "key_pair_name" {
  description = "key for server"
  default = ""
  
}

variable "subnet_public_id" {
  description = "VPC public subnet id"
  default = ""
}
variable "security_group_ids" {
  description = "EC2 ssh security group"
  type = "list"
  default = []
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}


variable "instance_ami" {
  description = "EC2 instance ami"
  default = "ami-0d6425a5f39bb836f"
}
variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}