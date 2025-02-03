variable "vpc_cidr_curso_test" {
  type        = string
  description = "CIDR de la vcp curso test"
}

variable "sub_public_curso_test" {
  type        = string
  description = "CIDR de la subnet publica"
}

variable "tags" {
  type        = map(string)
  description = "Tags del Proyecto"
}

variable "sg_ingress_curso_test" {
  type        = list(string)
  description = "CIDR para sg trafico ingress" 
}
