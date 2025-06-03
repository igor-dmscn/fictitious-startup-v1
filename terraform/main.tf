terraform {
  backend "s3" {
    bucket = "igor-cloudtalents-first-bucket"
    key    = "terraform/state"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["172.36.1.0/24", "172.36.2.0/24"]
}
