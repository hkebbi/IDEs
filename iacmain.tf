terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
  # Use environment variables or IAM roles instead of hardcoded keys:
  # export AWS_ACCESS_KEY_ID=...
  # export AWS_SECRET_ACCESS_KEY=...
}

resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Restricted security group"

  ingress {
    description = "SSH from trusted CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.trusted_cidr]
  }

  ingress {
    description = "App port from trusted CIDR"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.trusted_cidr]
  }

  egress {
    description = "Allow outbound to trusted CIDR"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.trusted_cidr]
  }
}

variable "trusted_cidr" {
  description = "CIDR block allowed to access the instance"
  type        = string
  default     = "10.0.0.0/8"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "my-insecure-demo-bucket-123456789"
}

resource "aws_s3_bucket_versioning" "app_versioning" {
  bucket = aws_s3_bucket.app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "app_logging" {
  bucket = aws_s3_bucket.app_bucket.id

  target_bucket = aws_s3_bucket.app_bucket.id
  target_prefix = "access-logs/"
}

resource "aws_s3_bucket_public_access_block" "app_pab" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_encryption" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
