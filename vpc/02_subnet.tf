# SubNet
resource "aws_subnet" "public-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "192.168.0.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false
  tags {
    Name     = "${var.env}-sbnt-public-a"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

resource "aws_subnet" "public-c" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "192.168.1.0/24"
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = false
  tags {
    Name     = "${var.env}-sbnt-public-c"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

resource "aws_subnet" "protected-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "192.168.2.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false
  tags {
    Name     = "${var.env}-sbnt-protected-a"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

resource "aws_subnet" "protected-c" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "192.168.3.0/24"
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = false
  tags {
    Name     = "${var.env}-sbnt-protected-c"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

resource "aws_subnet" "private-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "192.168.4.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false
  tags {
    Name     = "${var.env}-sbnt-private-a"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

resource "aws_subnet" "private-c" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "192.168.5.0/24"
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = false
  tags {
    Name     = "${var.env}-sbnt-private-c"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

resource "aws_subnet" "ngw-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "192.168.6.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false
  tags {
    Name     = "${var.env}-sbnt-ngw-a"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

resource "aws_subnet" "ngw-c" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "192.168.7.0/24"
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = false
  tags {
    Name     = "${var.env}-sbnt-ngw-c"
    Env      = "${var.env}"
  }
  depends_on = ["aws_vpc.vpc"]
}

