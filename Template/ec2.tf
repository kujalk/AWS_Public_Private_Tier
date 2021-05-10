
data "template_file" "user_data" {
  template = file("html.sh")
}

#EC2 instance creation for Dev
resource "aws_instance" "EC-1" {
  ami                    = var.AMI_ID
  instance_type          = var.EC2_Size
  subnet_id              = aws_subnet.public1.id
  key_name               = aws_key_pair.generated-key.key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = "Public-Server1"
    Env  = "Public"
  }
}


#EC2 instance creation
resource "aws_instance" "EC-2" {
  ami                    = var.AMI_ID
  instance_type          = var.EC2_Size
  subnet_id              = aws_subnet.public2.id
  key_name               = aws_key_pair.generated-key.key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = "Public-Server2"
    Env  = "Public"
  }
}

#EC2 instance creation
resource "aws_instance" "EC-3" {
  ami                    = var.AMI_ID
  instance_type          = var.EC2_Size
  subnet_id              = aws_subnet.private.id
  key_name               = aws_key_pair.generated-key.key_name
  vpc_security_group_ids = [aws_security_group.main2.id]

  tags = {
    Name = "Private-Server1"
    Env  = "Private"
  }
}