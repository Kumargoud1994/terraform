resource "aws_instance" "backend" {
    count = length(var.instance_names)
    ami = "ami-o9c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    # tags = {
    #     name = var.instance_names[count.index]
    # }
    tags - merge(
        var.common_tags,
        {
            name = var.instance_name[count.index]
        }
    )
}        

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh" #allow_sshh is already there in my account
  description = "allow port number 22 for SSH access"
  
  #usually we allow everything in egress
  #block
  egress {
       from_port        = 0
       to_port          = 0
       protocol         = "-1"
       cidr_blocks      = ["0.0.0.0/0"]
       ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
      ipv6_cidr_blocks = ["::/0"]
    }

    tags = merge(
        var.common_tags,
        {
            name = "allow-sshh"
        }
    )  
}

resource "aws_instance" "terraform" {

  ami = "var.ami_id" # left side and right side names need not to be same
  count  = 3
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = "terraform"
  }
}