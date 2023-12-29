resource "aws_s3_bucket" "tf_bucket" {
  bucket = "tfstate-file"

  tags = {
    Name = "My bucket"
  }
}

resource "aws_s3_bucket_policy" "tf_bucket_policy" {
  bucket = aws_s3_bucket.tf_bucket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-bucket-name/*"
    }
  ]
}
POLICY
}

