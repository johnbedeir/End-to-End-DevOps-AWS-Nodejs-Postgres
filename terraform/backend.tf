terraform {
  backend "s3" {
    bucket  = "tfstate-file"
    key     = "terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}
