resource "aws_instance" "web" {
  name = "web"
}
resource "aws_vpc" "project-vpc" {
  name = "project-vpc"
}