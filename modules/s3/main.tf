resource "aws_s3_bucket" "project_bucket" {
  bucket = var.bucket_name

  force_destroy = true

  tags = {
    Name = "${var.project}-bucket"
  }
}

resource "aws_s3_bucket_versioning" "project_bucket_versioning" {
  bucket = aws_s3_bucket.project_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

