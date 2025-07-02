provider "aws" {
  region = "us-east-1"
 }
 resource "aws_s3_bucket" "demo" {
  bucket = "drushya-demo-bucket-20250702"
  force_destroy = true
}
