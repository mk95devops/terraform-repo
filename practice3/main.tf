resource "aws_instance" "web" {
    ami = "ami-0b671272c81662a99"
    instance_type = t3.micro
  
}
resource "aws_vpc" "project-vpc" {
    cidr_block = "10.0.0.0/16"
}
