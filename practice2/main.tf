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

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_key_pair" "practice2" {
  key_name   = "practice2"
  public_key = file("~/.ssh/id_rsa.pub")
}