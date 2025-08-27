// create keypair
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key1" {
  key_name   = "terraformKey"
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.key.private_key_openssh
  filename        = "terraform-key.pem"
  file_permission = "0400"

}