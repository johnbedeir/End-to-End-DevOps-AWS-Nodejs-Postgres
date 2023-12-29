resource "aws_s3_bucket" "tf_bucket" {
  bucket = "tfstate-file"

  tags = {
    Name = "My bucket"
  }
}

