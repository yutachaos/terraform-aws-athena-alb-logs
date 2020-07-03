terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = var.region
}

resource "aws_s3_bucket" "for_athena_query" {
  bucket = "athena-query-result"
}

resource "aws_athena_workgroup" "elb_logs" {
  name = "alb-logs"

  configuration {
    enforce_workgroup_configuration = true
    result_configuration {
      output_location = "s3://${aws_s3_bucket.for_athena_query.bucket}/output/"
    }
  }
}

resource "aws_athena_database" "elb_logs" {
  name   = "alb_logs"
  bucket = aws_s3_bucket.for_athena_query.id
}

module "es_alb_create_table_query" {
  source          = "../."
  table_name      = "access_log"
  database_name   = aws_athena_database.elb_logs.name
  workgroup_id    = aws_athena_workgroup.elb_logs.id
  bucket_location = var.bucket_location
}


