resource "aws_s3_bucket" "project_bucket" {
  bucket = "${var.bucket_name}"
  versioning {
    enabled = true
  }
  tags = { Name = "${var.project}-bucket" }
}
