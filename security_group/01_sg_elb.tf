# sg for Elastic Load Balancers
# EXAMPLE
#resource "aws_security_group" "sg-alb" {
#  name        = "${var.env}-sg-alb"
#  description = "for ${var.env}alb"
#  vpc_id      = "${var.vpc_id}"
#
#  ingress {
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  tags {
#    Name     = "${var.env}-sg-msg-clb"
#    Env      = "${var.env}"
#  }
#}
