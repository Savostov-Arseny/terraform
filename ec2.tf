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


resource "aws_instance" "Management_master" {
  count                  = 1
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = templatefile(var.bootstrap_management_path, { access = "${aws_iam_access_key.adi.id}", secret = "${aws_iam_access_key.adi.secret}" })
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]
  tags = {
    Name = "Management_master"
  }
}
