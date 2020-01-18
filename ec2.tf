resource "aws_instance" "Swarm_master" {
  count                  = 1
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = file("${var.bootstrap_swarm_path}")
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]
  tags = {
    Name = "Swarm_master"
  }
}

resource "aws_instance" "Swarm_agent" {
  count                  = 8
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = file(var.bootstrap_swarm_path)
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]
  tags = {
    Name = "Swarm_agent_${count.index}"
  }
}

#Using a template to pass freshly created i_am keys
resource "template_file" "user_data_management" {
  template = "${file("${var.bootstrap_management_path}")}"
  vars = {
    access = "${aws_iam_access_key.adi.id}"
    secret = "${aws_iam_access_key.adi.secret}"
  }
}

resource "aws_instance" "Management_master" {
  count                  = 1
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = "${template_file.user_data_management.rendered}"
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]
  tags = {
    Name = "Management_master"
  }
}
