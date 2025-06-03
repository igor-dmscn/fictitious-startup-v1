variable "vpc_cidr" {
  description = "cidr for the vpc"
  type = string
}

variable "public_subnet_cidrs" {
  description = "list of public subnet cidrs"
  type = list(string)
}

variable "private_subnet_cidrs" {
  description = "list of private subnet cidrs"
  type = list(string)
}
