# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_iam_user" "lb" {
  name = "mk"

}

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
  user= "mk"
}