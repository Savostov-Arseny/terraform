#Data source to get ami id of Ubuntu 18.04
data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  owners = ["099720109477"] #Canonical
}

## Docker swarm
resource "aws_instance" "Swarm_master" {
  count                  = 1
  ami                    = "${data.aws_ami.ubuntu_ami.id}"
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = templatefile(var.bootstrap_swarm_path, { public_key = file(var.public_key_path) })
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]
  tags = {
    Name = "Swarm_master"
  }
}

resource "aws_instance" "Swarm_agent" {
  count                  = 1
  ami                    = "${data.aws_ami.ubuntu_ami.id}"
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = templatefile(var.bootstrap_swarm_path, { public_key = file(var.public_key_path) })
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]
  tags = {
    Name = "Swarm_agent_${count.index}"
  }
}

## Ansible master
resource "aws_instance" "Ansible_master" {
  count                  = 1
  ami                    = "${data.aws_ami.ubuntu_ami.id}"
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = templatefile(var.bootstrap_ansible_path, { public_key = file(var.public_key_path), private_key = file(var.private_key_path) })
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]
  iam_instance_profile   = "${aws_iam_instance_profile.ec2_read_access_profile.name}"
  tags = {
    Name = "Ansible_master"
  }
}

## Jenkins_master
resource "aws_instance" "Jenkins_master" {
  count         = 1
  ami           = "${data.aws_ami.ubuntu_ami.id}"
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data = templatefile(var.bootstrap_jenkins_path,
    { public_key = file(var.public_key_path), private_key = file(var.private_key_path), juser = var.juser, jpass = var.jpass,
  dockeruser = var.dockeruser, dockerpassword = var.dockerpassword, ansible_host = "${aws_instance.Ansible_master[0].private_ip}" })
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]
  tags = {
    Name = "Jenkins_master"
  }
}
