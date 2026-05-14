resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "main"
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file($"~/.ssh/id_rsa.pub")
}