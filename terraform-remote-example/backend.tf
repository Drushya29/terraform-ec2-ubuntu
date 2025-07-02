terraform {
 backend "s3" {
   bucket      = "terraform-state-drushya-20250702"
   key         = "remote-example/terraform.tfstate"
   region      = "us-east-1"
   dynamodb_table = "terraform-locks"
   encrypt     = true
}
}
