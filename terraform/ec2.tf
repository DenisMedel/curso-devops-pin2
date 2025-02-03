resource "aws_instance" "ec2_curso_test" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.sub_public_curso_test.id
  key_name      = data.aws_key_pair.rsa_ec2_curso_test.key_name
  vpc_security_group_ids = [aws_security_group.sg_curso_test.id]
  user_data = "${file("ec2-script.sh")}"
}
