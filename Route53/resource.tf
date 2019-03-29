data "aws_route53_zone" "selected" {
  name         = "grasshopperkiosks.com"
  private_zone = true
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${var.sub_name}.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = "${aws_eip.testInstanceEip.public_ip}"
}