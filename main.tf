# Existing VPC
data "aws_vpc" "existing" {
  id = var.vpc_id
}

# Existing Subnet
data "aws_subnet" "subnet_existing" {
  id = var.subnet_id
}

# Security Group in Existing VPC
resource "aws_security_group" "sg" {
  name        = "my-sg"
  description = "Allow SSH"
  vpc_id      = data.aws_vpc.existing.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
