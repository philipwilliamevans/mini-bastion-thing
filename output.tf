output "public_bastion_public_ip" {
    value = aws_instance.bastion-public.public_ip
}

output "private_bastion_private_ip" {
    value = aws_instance.bastion-private.private_ip
}