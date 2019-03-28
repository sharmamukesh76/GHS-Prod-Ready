
variable "identifier" {}

variable "allocated_storage" {}

variable "engine" {}

variable "engine_version" {}

variable "instance_class" {}

variable "name" {}

variable "username" {}

variable "password" {}

variable "multi_az" {
  default = false
}

variable "publicly_accessible" {
  default = false
}

variable "skip_final_snapshot" {
  default = true
}

variable "vpc_security_group_ids" {
  type = "list"
  default =["sg-0ff5db2c926b78bd8"]
}


variable "vpc_id" {}


variable "db_subnet_group_name" {
  default = "prod_db_subnet_group"
}

variable "depends_on" {
  type = "list"
  default = []
}




