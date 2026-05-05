

# Create a VPC
resource "aws_vpc" "practice2" {
  cidr_block = "10.0.0.0/16"
  name = "practice2"
}