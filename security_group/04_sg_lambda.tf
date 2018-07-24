# sg for Lambda
# EXAMPLE
#resource "aws_security_group" "sg-lambda" {
#  name        = "${var.env}-sg-lambda"
#  description = "${var.env} for lambda"
#  vpc_id      = "${var.vpc_id}"
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  tags {
#    Name     = "${var.env}-sg-lambda"
#    Env      = "${var.env}"
#  }
#}

