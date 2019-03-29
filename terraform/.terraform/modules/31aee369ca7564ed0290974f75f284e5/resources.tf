provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "instance" {
  ami                    = "${var.instance_ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_public_id}"
  user_data              = "${file("files/bootstrap.sh")}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  key_name               = "${var.key_pair_name}"

  tags {
    "Environment" = "${var.environment_tag}"
  }
}

resource "aws_eip" "testInstanceEip" {
  vpc      = true
  instance = "${aws_instance.instance.id}"

  tags {
    "Environment" = "${var.environment_tag}"
  }
}

data "aws_route53_zone" "selected" {
  name         = "grasshopperkiosks.com."
  private_zone = false
}

resource "aws_route53_record" "lhbsuper" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "lhbsuperadmin.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.testInstanceEip.public_ip}"]
}

resource "aws_route53_record" "lhbdisp" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "lhbdispadmin.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.testInstanceEip.public_ip}"]
}

resource "aws_route53_record" "lhbapi" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "lhbapis.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.testInstanceEip.public_ip}"]
}

resource "aws_route53_record" "lhbdb" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "lhbdb.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.testInstanceEip.public_ip}"]
}
