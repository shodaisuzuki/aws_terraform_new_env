# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name     = "${var.env}-igw"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}
# Elastic IP for NatGateWay
resource "aws_eip" "ngw-eip" {
  vpc = true
}

# Nat Gateway
resource "aws_nat_gateway" "ngw-a" {
  subnet_id     = "${aws_subnet.ngw-a.id}"
  allocation_id = "${aws_eip.ngw-eip.id}"
  depends_on = ["aws_eip.ngw-eip"]
}
