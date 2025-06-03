terraform {
  backend "s3" {
    bucket = "igor-cloudtalents-first-bucket"
    key    = "terraform/state"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "./vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["172.16.1.0/24", "172.16.2.0/24"]
}
