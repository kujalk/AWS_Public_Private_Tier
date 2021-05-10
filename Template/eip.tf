resource "aws_eip" "nat" {
  vpc = true
  depends_on = [
    aws_internet_gateway.main
  ]
}

resource "aws_eip" "ec1" {
  instance = aws_instance.EC-1.id
  vpc      = true
}

resource "aws_eip" "ec2" {
  instance = aws_instance.EC-2.id
  vpc      = true
}