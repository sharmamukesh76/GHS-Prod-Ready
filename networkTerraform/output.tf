output "vpc_id" {
  value = "${aws_vpc.prod_vpc.id}"
}
output "public_subnets" {
  value = ["${aws_subnet.prod_subnet_public.id}"]
}
output "private_subnets" {
  value = ["${aws_subnet.prod_subnet_private.id}"]
}