resource "aws_athena_named_query" "create_table" {
  name      = "${var.database_name}_${var.table_name}_create_table"
  workgroup = var.workgroup_id
  database  = var.database_name
  query = templatefile("${path.module}/sql/alb_log_create_table.sql.tmpl",
    {
      database_name   = var.database_name
      table_name      = var.table_name
      bucket_location = "s3://${var.bucket_location}/AWSLogs/${data.aws_caller_identity.current.account_id}/elasticloadbalancing/${data.aws_region.current.name}"
  })
}
