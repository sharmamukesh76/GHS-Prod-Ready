provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}


data "terraform_remote_state" "network" {
  backend = "local"

  config {
    path = "../networkTerraform/terraform.tfstate"
  }
}

module "securityGroupModule" {
  source			= "./modules/securityGroup"
 	access_key		= "${var.access_key}"
	secret_key		= "${var.secret_key}"
	region			= "${var.region}"
	vpc_id			= "${data.terraform_remote_state.network.vpc_id}"
	environment_tag = "${var.environment_tag}"
}

module "instanceModule" {
  source 				= "./modules/instance"
	access_key 			= "${var.access_key}"
 	secret_key 			= "${var.secret_key}"
 	region     			= "${var.region}"
 	vpc_id 				= "${data.terraform_remote_state.network.vpc_id}"
	subnet_public_id	= "${data.terraform_remote_state.network.public_subnets[0]}"
	security_group_ids 	= ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80}", "${module.securityGroupModule.sg_443}"]
	environment_tag 	= "${var.environment_tag}"
}

module "db_instance" {
  source            = "./modules/rds"
  vpc_id            = "${data.terraform_remote_state.network.vpc_id}"
  identifier        = "${var.db_identifier}"
  allocated_storage = "${var.allocated_storage}"
  engine            = "${var.engine}"
  engine_version    = "${var.engine_version}"
  instance_class    = "${var.instance_class}"

  name              = "${var.db_name}"
  username          = "${var.db_username}"
  password          = "${var.db_password}"
	multi_az            = "${var.multi_az}"
  publicly_accessible = "${var.publicly_accessible}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
}
