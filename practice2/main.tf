data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = aws_key_pair.practice2.key_name
  user_data = file("installweb.sh")
  vpc_security_group_ids = aws_security_group.web_sg.id

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_key_pair" "practice2" {
  key_name   = "practice2"
  public_key = file("~/.ssh/id_rsa.pub")
}
# 1. Define the Security Group
resource "aws_security_group" "web_sg" {
  name        = "allow_web_traffic"
  description = "Allow port 80 and 443"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
