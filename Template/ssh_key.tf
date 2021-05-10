resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
  /*
  provisioner "local-exec" {
    command     = <<EOT
    echo -e "${tls_private_key.ssh-key.private_key_pem}" > ${var.keyname}.pem
    chmod 400 ${var.keyname}.pem
    EOT
    interpreter = ["bash","-c"]
  }
*/
}

resource "aws_key_pair" "generated-key" {
  key_name   = var.Keyname
  public_key = tls_private_key.ssh-key.public_key_openssh
}
