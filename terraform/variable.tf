variable "access_key" { }
variable "secret_key" { }
variable "region" {
  default = "us-east-2"
}
variable "availability_zone" {
  default = "us-east-2a"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "prod"
}

variable "db_identifier" {}
  
variable "allocated_storage" {
  default = "20"
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = "5.6.41"
}
variable "instance_class" {
  default = "db.t2.micro"
}

variable "db_name" {}

variable "db_username" {}

variable "db_password" {}

variable "multi_az" {
  default = false
}

variable "publicly_accessible" {
  default = false
}

variable "skip_final_snapshot" {
  default = true
}