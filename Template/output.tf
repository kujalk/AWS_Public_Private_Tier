
output "Public-1-EC2-IP" {
  value = aws_instance.EC-1.public_ip
}

output "Public-2-EC2-IP" {
  value = aws_instance.EC-2.public_ip
}

output "Private-1-EC2-IP" {
  value = aws_instance.EC-3.public_ip
}

output "LB-Name" {
  value = aws_lb.test.dns_name
}