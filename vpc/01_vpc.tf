# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = "192.168.0.0/21"
  enable_dns_hostnames = true
  tags {
    Name     = "${var.env}-vpc"
  }
}
# DHCP Options
resource "aws_vpc_dhcp_options" "dhcp_options" {
  domain_name          = "${var.region}.compute.internal"
  domain_name_servers  = ["AmazonProvidedDNS"]
  tags {
    Name     = "${var.env}-dhcp-options"
  }
}
# DHCP Option Associate
resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp_options.id}"
}
