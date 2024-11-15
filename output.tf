output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.myec2.public_ip
}