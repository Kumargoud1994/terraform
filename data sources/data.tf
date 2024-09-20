# Find the latest available AMI that is tagged with Component = web
data "aws_ami" "joindevops" {

    most_recent    = true
    owners =[973714476881]

    filter {
       name   = "name"
       values = ["RHEL-9-Devops-practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
}
