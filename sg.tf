resource "aws_security_group" "bastion_sg" {
    vpc_id    = var.vpc_name
    name      = "${var.prefix}-bastion-sg"

    ingress {
        protocol    = "tcp"
        from_port   = 443
        to_port     = 443
        cidr_blocks = ["${var.current_public_ip}/32"]
    }
    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.prefix}-bastion-sg"
    }
}

resource "aws_security_group_rule" "allow_public_to_private" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"

  source_security_group_id = aws_security_group.bastion_sg.id

  security_group_id = var.deductions_component_sg_id
}