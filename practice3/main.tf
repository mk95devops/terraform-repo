resource "aws_instance" "web" {
  
}
resource "aws_vpc" "project-vpc" {
    cidr_block = "10.0.0.0/16"
}