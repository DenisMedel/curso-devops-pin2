vpc_cidr_curso_test = "10.0.0.0/16"

sub_public_curso_test = "10.0.0.0/24"

tags = {
  "Owner" = "Medel_Denis"
  "Cliente" = "Curso"
  "Entorno" = "Test"
  "IAC" = "Terraform"
  "IAC_Version" = "v1.10.5"
}

sg_ingress_curso_test = ["190.123.91.63/32", "24.232.148.139/32"]
