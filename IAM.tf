#Create IAM role
resource "aws_iam_role" "ec2_read_access_role" {
  name               = "EC2_RO_role"
  assume_role_policy = file("AssumeRolePolicy.json")

}
#Create IAM policy to manage EC2
resource "aws_iam_policy" "ec2_read_access_policy" {
  name   = "EC2_read_only"
  policy = file("AmazonEC2ReadOnlyAccess.json")
}
#Attach policy to role
resource "aws_iam_role_policy_attachment" "ec2_read_access_attach" {
  role       = "${aws_iam_role.ec2_read_access_role.name}"
  policy_arn = "${aws_iam_policy.ec2_read_access_policy.arn}"
}
#Create instance profile, that will be attached to instance
resource "aws_iam_instance_profile" "ec2_read_access_profile" {
  name = "EC2_RO_role"
  role = "${aws_iam_role.ec2_read_access_role.name}"
}
