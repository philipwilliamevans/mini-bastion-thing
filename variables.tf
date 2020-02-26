variable "region" {
    default = "eu-west-2"
}

variable "prefix" {}

variable "key_name" {}

variable "vpc_name" {}

variable "bastion_public_subnet_id" {}

variable "bastion_private_subnet_id" {}

variable "deductions_component_sg_id" {}

variable "current_public_ip" {}
