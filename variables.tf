#Main variables
variable "aws_region" {
  description = "AWS region"
}
variable "access_key" {
}
variable "secret_key" {
}

#ec2 variables
variable "instance_type" {
  description = "Instance type"
}
variable "key_name" {
  description = "Desired name of Keypair..."
}
variable "bootstrap_swarm_path" {
  description = "Script to install Docker Engine and docker-compose"
  default     = "Bootstrap_scripts/user_data_swarm.sh"
}

variable "bootstrap_management_path" {
  description = "Script to install Docker Engine and all management tools"
  default     = "Bootstrap_scripts/user_data_management.tmpl"
}
