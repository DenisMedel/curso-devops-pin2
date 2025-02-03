output "ec2_public_ip" {
  description = "Ip publica de la instancia"
  value = aws_instance.ec2_curso_test.public_ip
}
