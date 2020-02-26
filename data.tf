data "aws_ami" "amazon_linux_2" {
 most_recent = true
 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
 filter {
   name = "architecture"
   values = ["x86_64"]
 }
 owners = ["137112412989"] #amazon
}

data "aws_ssm_parameter" "inbound_ips" {
    name = "/NHS/dev-${data.aws_caller_identity.current.account_id}/tf/inbound_ips"
}

data "aws_caller_identity" "current" {}
