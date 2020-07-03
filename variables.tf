variable "workgroup_id" {
  description = "ID of workgroup used in athena."
  type        = string
}
variable "database_name" {
  description = "Name of database used in athena."
  type        = string
}
variable "table_name" {
  description = "Name of table used in athena."
  type        = string
}
variable "bucket_location" {
  description = "S3 path where alb log is output location."
  type        = string
}

