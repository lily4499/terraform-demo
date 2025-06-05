# main.tf
provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "example" {
  bucket = "jenkins-terraform-demo-${random_id.rand.hex}"
  acl    = "private"
}

resource "random_id" "rand" {
  byte_length = 4
}
