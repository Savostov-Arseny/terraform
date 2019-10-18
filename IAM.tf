#Creating user for  ansible dynamic inventory
resource "aws_iam_user" "adi" {
  name = "ansible_dynamic_inventory"

  tags = {
    name = "ansible_dynamic_inventory"
  }
}
#Creating EC2 read_only policy
resource "aws_iam_user_policy" "adi_ro" {
  name   = "ec2_ro"
  user   = "${aws_iam_user.adi.name}"
  policy = file("AmazonEC2ReadOnlyAccess.json")
}

#Creating access key
resource "aws_iam_access_key" "adi" {
  user = "${aws_iam_user.adi.name}"
}
