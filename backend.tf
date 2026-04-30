terraform {
  backend "s3" {
    bucket = "terraform-state-veeru-12345"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
