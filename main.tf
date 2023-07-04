resource "aws_instance" "web-instance" {
  ami                         = "ami-03265a0778a880afb"
  instance_type               = "t2.micro"
  key_name                    = "aws_login"
  tags                        = {
    Name = "web-instance"
  }
  security_groups = [
    aws_security_group.web_server.name
  ]

}

resource "aws_security_group" "web_server" {
  name        = "web_server"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [0.0.0.0/0]
  }

  ingress {
    description      = "SSH"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [0.0.0.0/0]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "web_server"
  }
}