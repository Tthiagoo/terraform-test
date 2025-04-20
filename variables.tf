variable "aws_region" {
  default = "us-east-2"
}

variable "build_bucket" {
  description = "Nome do bucket onde a build foi enviada"
  type        = string
}

variable "build_path" {
  description = "Caminho da pasta dentro do bucket"
  type        = string
  default     = "open-next"
}
