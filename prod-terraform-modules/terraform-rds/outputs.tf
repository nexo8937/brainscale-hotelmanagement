output "database_sg" {
  value = module.rds.rds-access
}

output "db_endpoint" {
  value = module.rds.rds_endpoint
}
