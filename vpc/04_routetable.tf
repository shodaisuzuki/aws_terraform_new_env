# Route Table
resource "aws_route_table" "public-rtb" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  route {
    cidr_block = "157.101.252.3/32"
    nat_gateway_id = "${aws_nat_gateway.ngw-a.id}"
  }
  tags {
    Name     = "${var.env}-rtbl-public"
    Env      = "${var.env}"
  }
  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_route_table" "protected-a-rtb" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.ngw-a.id}"
  }
  tags {
    Name     = "${var.env}-rtbl-protected-a"
    Env      = "${var.env}"
  }
  depends_on = ["aws_nat_gateway.ngw-a"]
}

resource "aws_route_table" "protected-c-rtb" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.ngw-a.id}"
  }
  tags {
    Name     = "${var.env}-rtbl-protected-c"
    Env      = "${var.env}"
  }
  depends_on = ["aws_nat_gateway.ngw-a"]
}

resource "aws_route_table" "private-rtb" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name     = "${var.env}-rtbl-private"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

resource "aws_route_table" "ngw-rtb" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags {
    Name     = "${var.env}-rtbl-ngw"
    Env      = "${var.env}"
  }
  depends_on = ["aws_internet_gateway.igw"]
}

# Route Table  Association
resource "aws_route_table_association" "public-a-attach" {
  subnet_id      = "${aws_subnet.public-a.id}"
  route_table_id = "${aws_route_table.public-rtb.id}"
  depends_on = ["aws_subnet.public-a"]
}

resource "aws_route_table_association" "public-c-attach" {
  subnet_id      = "${aws_subnet.public-c.id}"
  route_table_id = "${aws_route_table.public-rtb.id}"
  depends_on = ["aws_subnet.public-c"]
}

resource "aws_route_table_association" "protected-a-attach" {
  subnet_id      = "${aws_subnet.protected-a.id}"
  route_table_id = "${aws_route_table.protected-a-rtb.id}"
  depends_on = ["aws_nat_gateway.ngw-a"]
}

resource "aws_route_table_association" "protected-c-attach" {
  subnet_id      = "${aws_subnet.protected-c.id}"
  route_table_id = "${aws_route_table.protected-c-rtb.id}"
  depends_on = ["aws_nat_gateway.ngw-a"]
}

resource "aws_route_table_association" "private-a-attach" {
  subnet_id      = "${aws_subnet.private-a.id}"
  route_table_id = "${aws_route_table.private-rtb.id}"
  depends_on = ["aws_subnet.private-a"]
}

resource "aws_route_table_association" "private-c-attach" {
  subnet_id      = "${aws_subnet.private-c.id}"
  route_table_id = "${aws_route_table.private-rtb.id}"
  depends_on = ["aws_subnet.private-c"]
}

resource "aws_route_table_association" "ngw-a-attach" {
  subnet_id      = "${aws_subnet.ngw-a.id}"
  route_table_id = "${aws_route_table.ngw-rtb.id}"
  depends_on = ["aws_nat_gateway.ngw-a"]
}

resource "aws_route_table_association" "ngw-c-attach" {
  subnet_id      = "${aws_subnet.ngw-c.id}"
  route_table_id = "${aws_route_table.ngw-rtb.id}"
  depends_on = ["aws_nat_gateway.ngw-a"]
}

# VPC EndPoint S3
resource "aws_vpc_endpoint" "vpc-endpoint-s3" {
  vpc_id = "${aws_vpc.vpc.id}"
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = [
    "${aws_route_table.public-rtb.id}",
    "${aws_route_table.protected-a-rtb.id}",
    "${aws_route_table.protected-c-rtb.id}"
  ]
  depends_on = ["aws_route_table.protected-c-rtb"]
}

