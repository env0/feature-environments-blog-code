terraform {
  required_version = ">= 0.12.7"
}

locals {
  environment_name = terraform.workspace
  index_html_file = "${terraform.workspace}.index.html"
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "website_bucket" {
  bucket =  "${local.environment_name}.feature.environment.blog.com"
  acl    = "public-read"

  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Public-Access",
  "Statement": [
    {
      "Sid": "Allow-Public-Access-To-Bucket",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": [
          "arn:aws:s3:::${aws_s3_bucket.website_bucket.bucket}/*"
      ]
    }
  ]
}
POLICY
}

output "website_endpoint" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}

output "s3_bucket_name" {
  value = aws_s3_bucket.website_bucket.id
}
