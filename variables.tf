#Main variables
variable "aws_region" {
  default = "eu-north-1"
}
#ec2 variables

variable "ami" {
  description = "Amazon Ubuntu Server 18.04 LTS (HVM), SSD Volume Type (64-bit x86) AMI"
  default     = "ami-ada823d3"
}
variable "instance_type" {
  description = "Instance type"
  default     = "t3.micro"
}
variable "key_path" {
  description = "SSH Public Key path"
  default     = "" # type key path here
}
variable "key_name" {
  description = "Desired name of Keypair..."
  default     = "" #type existing key name here
}
variable "bootstrap_swarm_path" {
  description = "Script to install Docker Engine and docker-compose"
  default     = "Bootstrap_scripts/user_data_swarm.sh"
}

variable "bootstrap_management_path" {
  description = "Script to install Docker Engine and all management tools"
  default     = "Bootstrap_scripts/user_data_management.tmpl"
}
