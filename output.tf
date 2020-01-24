output "Ansible_master_address" {
  value = "${aws_instance.Ansible_master[0].public_ip}"
}

output "Swarm_master_address" {
  value = "${aws_instance.Swarm_master[0].public_ip}"
}
