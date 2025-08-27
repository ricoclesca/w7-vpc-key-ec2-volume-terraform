// ec2 instance code

resource "aws_instance" "server" {
  ami                    = "ami-045269a1f5c90a6a0" // amazon linux 2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.key1.key_name
  user_data              = file("setup.sh") // bootstrap script
  tags = {
    Name = "Terraform-project-server"
    env  = "Dev"

  }
}

// EBS volume attachment to instance

resource "aws_ebs_volume" "EBS" {
  availability_zone = aws_instance.server.availability_zone
  size              = 20 // in GB
  tags = {
    Name = "Extra-Volume"
  }
}
resource "aws_volume_attachment" "att" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.EBS.id
  instance_id = aws_instance.server.id

}
