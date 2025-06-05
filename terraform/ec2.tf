data "aws_ami" "ubuntu" {
  owners = ["099720109477"]
  filter {
    name = "name"
    values = ["ubuntu/images/*ubuntu-jammy-22.04-amd64-server*"]
  }
}

resource "aws_instance" "ec2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = module.vpc.public_subnet_ids[0]
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.security_group.id]
  iam_instance_profile = "arn:aws:iam::462753922172:instance-profile/AppSessionManager"
}

resource "aws_security_group" "security_group" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
