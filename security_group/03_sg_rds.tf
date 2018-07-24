# sg for RDS
# EXAMPLE
#resource "aws_security_group" "sg-rds" {
#  name        = "${var.env}-sg-rds"
#  description = "for rds"
#  vpc_id      = "${var.vpc_id}"
#
#  ingress {
#    from_port       = 5432
#    to_port         = 5432
#    protocol        = "tcp"
#    security_groups = [
#      "${aws_security_group.sg-ec2.id}",
#    ]
#  }
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  tags {
#    Name     = "${var.env}-sg-rds"
#    Env      = "${var.env}"
#  }
#}
