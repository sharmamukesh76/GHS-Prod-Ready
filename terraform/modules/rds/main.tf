
resource "aws_db_instance" "default" {
  #depends_on             = ["aws_security_group.sg-rds"]
  identifier             = "${var.identifier}"
  allocated_storage      = "${var.allocated_storage}"
  engine                 = "${var.engine}"
  engine_version         = "${var.engine_version}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.name}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  db_subnet_group_name   = "${var.db_subnet_group_name}"
  multi_az               = "${var.multi_az}"
  publicly_accessible = "${var.publicly_accessible}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
}
