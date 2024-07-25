resource "aws_s3_bucket" "s3bucket" {
  bucket = "vpc-s3bucket-01"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "s3" {
  bucket = aws_s3_bucket.s3bucket.id
  key    = "terraform.tfstate"
}