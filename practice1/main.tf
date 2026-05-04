# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = local.common_tags
}


# Create IAM USER
resource "aws_iam_user" "lb" {
  name = "mk"

}

# Create IAM USER
resource "aws_iam_user" "lana"{
  name= "Lana"
  
}

# Create IAM GROUP
resource "aws_iam_group" "developers" {
  name = "developers"
}

# Create IAM Group Membership



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

  tags = local.common_tags
}

# Adding key pair 
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = local.common_tags
}
