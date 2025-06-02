terraform {
  backend "s3" {
    bucket = "igor-cloudtalents-first-bucket"
    key    = "terraform/state"
    region = "us-east-2"
  }
}
