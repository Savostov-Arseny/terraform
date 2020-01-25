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
  default     = "Bootstrap_scripts/user_data_swarm.tmpl"
}

variable "bootstrap_ansible_path" {
  description = "Script to install Ansible & configurations"
  default     = "Bootstrap_scripts/user_data_ansible.tmpl"
}

variable "bootstrap_jenkins_path" {
  description = "Script to install Ansible & configurations"
  default     = "Bootstrap_scripts/user_data_jenkins.tmpl"
}

# RSA keys
variable "public_key_path" {
  description = "path to public_key"
}
variable "private_key_path" {
  description = "path to private_key"
}

#Jenkins_master variables
variable "juser" {
  default = "Jenkins default user login"
}
variable "jpass" {
  default = "Jenkins default user password"
}
variable "dockeruser" {
  default = "Dockerhub user"
}
variable "dockerpassword" {
  default = "Dockerhub password"
}
