resource "aws_s3_bucket" "tf_bucket" {
  bucket = "tfstate-file"
  acl    = "private"

  tags = {
    Name = "My bucket"
  }
}
