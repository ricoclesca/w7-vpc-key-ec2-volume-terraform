output "public_ip" {
  value = aws_instance.server.public_ip

}

output "vpc_id" {
  value = aws_vpc.my-vpc.id

}