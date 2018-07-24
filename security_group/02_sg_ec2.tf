# sg for EC2
# EXAMPLE
#resource "aws_security_group" "sg-ec2" {
#  name        = "${var.env}-sg-ec2"
#  description = "for{var.env} ec2"
#  vpc_id      = "${var.vpc_id}"
#
#  ingress {
#    from_port       = 80
#    to_port         = 80
#    protocol        = "tcp"
#    security_groups = ["${aws_security_group.sg-alb.id}"]
#  }
#  ingress {
#    from_port       = 22
#    to_port         = 22
#    protocol        = "tcp"
#    security_groups = ["${aws_security_group.sg-ec2.id}"]
#  }
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  tags {
#    Name     = "${var.env}-sg-web-ec2"
#    Env      = "${var.env}"
#  }
#}
