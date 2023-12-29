resource "aws_s3_bucket" "tf_bucket" {
  bucket = "tfstate-file"

  tags = {
    Name = "My bucket"
  }
}

resource "aws_s3_bucket_acl" "tf_bucket_acl" {
  bucket = aws_s3_bucket.tf_bucket.id
  acl    = "private"
}
