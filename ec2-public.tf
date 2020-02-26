resource "aws_instance" "bastion-public" {
    ami                             = data.aws_ami.amazon_linux_2.id
    instance_type                   = "t2.micro"
    vpc_security_group_ids          = [aws_security_group.bastion_sg.id]
    associate_public_ip_address     = true
    subnet_id                       = var.bastion_public_subnet_id
    key_name                        = var.key_name

    user_data = <<-EOF
                    #!/bin/bash -ex
                    perl -pi -e 's/^#?Port 22$/Port 443/' /etc/ssh/sshd_config
                    service sshd restart || service ssh restart
                    EOF

    tags = {
        Name = "${var.prefix}-bastion-public"
    }
}