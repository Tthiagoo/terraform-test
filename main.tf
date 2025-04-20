
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "thiago-bucket-iac-2"

  tags = {
    Name    = "Primeiroo bucket"
    Iac     = "true"
  }
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "Th-rocketseat"

  create_dlq = true
 

  tags = {
    Environment = "dev"
  }
}



# Faz o download do build do S3
resource "null_resource" "baixar_build_open_next" {
  provisioner "local-exec" {
    command = "aws s3 sync s3://${var.build_bucket}/${var.build_path}./build"
  }
}

module "open-next_tf-aws-open-next-zone" {
  source      = "RJPearson94/open-next/aws//modules/tf-aws-open-next-zone"
  version = "2.2.0"

  folder_path = "${path.module}/build"

  depends_on = [null_resource.baixar_build_open_next]

  providers = {
    aws                 = aws
    aws.global          = aws
    aws.iam             = aws
    aws.dns             = aws
    aws.server_function = aws
  }
}
