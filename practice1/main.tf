# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name= "Practice"
    Environment= "Dev"
    Createdby= "MK"

  }
}

resource "aws_iam_user" "lb" {
  name = "mk"

}
resource "aws_iam_user" "lana"{
  name= "Lana"
  group= "developers"
}

resource "aws_iam_group" "developers" {
  name = "developers"
}

# IAM Policy 
resource "aws_iam_policy" "test_policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# S3 Bucket
resource "aws_s3_bucket" "example" {
  bucket_prefix = "my-tf-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Adding key pair 
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}