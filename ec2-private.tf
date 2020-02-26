resource "aws_instance" "bastion-private" {
    ami                             = data.aws_ami.amazon_linux_2.id
    instance_type                   = "t2.micro"
    vpc_security_group_ids          = [var.deductions_component_sg_id]
    subnet_id                       = var.bastion_private_subnet_id
    key_name                        = var.key_name
    
    tags = {
        Name = "${var.prefix}-bastion-private"
    }
}