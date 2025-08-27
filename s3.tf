resource "aws_s3_bucket" "s3" {
  bucket = "week7-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
