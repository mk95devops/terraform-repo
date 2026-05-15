resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "main"
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}





resource "aws_subnet" "subnet1" {
  availability_zone = data.aws_availability_zones.available.names[0]
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

}

resource "aws_subnet" "subnet2" {
  availability_zone = data.aws_availability_zones.available.names[1]
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

}

resource "aws_subnet" "subnet3" {
  availability_zone = data.aws_availability_zones.available.names[2]
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"

}