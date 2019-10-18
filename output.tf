output "Management_master_address" {
  value = "${aws_instance.Management_master[0].public_ip}"
}

output "Swarm_master_address" {
  value = "${aws_instance.Swarm_master[0].public_ip}"
}
