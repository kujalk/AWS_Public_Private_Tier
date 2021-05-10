/*
Purpose - To create an EC2 instance with VPC (Public Subnet) with Security Group attached
Developer - K.Janarthanan
*/


#Security Group
resource "aws_security_group" "main" {
  name        = var.SecurityGroup_Name1
  description = "To allow HTTP and SSH Traffic"
  vpc_id      = aws_vpc.main.id


  tags = {
    Name = var.SecurityGroup_Name1
  }

  ingress {
    description = "HTTP Traffic Allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH Traffic Allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.VPC_CIDR]
  }

  egress {
    description = "Outside"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Security Group private
resource "aws_security_group" "main2" {
  name        = var.SecurityGroup_Name2
  description = "To allow HTTP and SSH Traffic"
  vpc_id      = aws_vpc.main.id


  tags = {
    Name = var.SecurityGroup_Name2
  }

  ingress {
    description = "Custom Arena-TCP Allow"
    from_port   = 27950
    to_port     = 27965
    protocol    = "tcp"
    cidr_blocks = [var.VPC_CIDR]
  }

  ingress {
    description = "Custom Arena-UDP Allow"
    from_port   = 27950
    to_port     = 27965
    protocol    = "udp"
    cidr_blocks = [var.VPC_CIDR]
  }

  ingress {
    description = "SSH Traffic Allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.VPC_CIDR]
  }

  egress {
    description = "Outside"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Security Group for LB
resource "aws_security_group" "lb" {
  name        = var.SecurityGroup_Name3
  description = "To allow HTTP and SSH Traffic"
  vpc_id      = aws_vpc.main.id


  tags = {
    Name = var.SecurityGroup_Name3
  }

  ingress {
    description = "HTTP Traffic Allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outside"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}