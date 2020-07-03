output "query_id" {
  value       = aws_athena_named_query.create_table.id
  description = "Created athena named query id"

}