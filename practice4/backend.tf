terraform {
  backend "s3" {
    bucket = "terraform-mkhamidov-s3"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
