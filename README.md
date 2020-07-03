## Description

Terraform module that creates an athena named query of CREATE TALBE for ALB log analysis.

## Usage  
See [examples](./examples "directory").

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_location | S3 path where alb log is output | `string` | n/a | yes |
| database\_name | Name of database used in athena | `string` | n/a | yes |
| table\_name | Name of table used in athena | `string` | n/a | yes |
| workgroup\_id | ID of workgroup used in athena | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| query\_id | Created athena named query id |

