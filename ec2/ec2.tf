resource "aws_security_group" "allow_ssh_terraform" {
  name        = var.sg_name
  description = var.sg_description
  
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
    tags = var.tags
    
  }

resource "aws_instance" "terraform" {

  ami = "var.ami_id" # left side and right side names need not to be same
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = "terraform"
  }
}
