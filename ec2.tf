provider "aws" {
  profile = "default"
  region  = "us-east-1"
  access_key = "AKIAXH6PITZUF3C33TIQ"
  secret_key = "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"
}

resource "aws_instance" "ec201" {
  ami ="ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  #role= "aws_iam_role.EC2S3TF1.name"
  #iam_instance_profile = [aws_iam_instance_profile.EC2S3TF1.name]
  security_groups = [aws_security_group.TerraformEc2_security1.name]
  key_name = "ec2instance"
  tags = {
    ec2_create = "instance1"
  }
}
resource "aws_default_vpc" "main" {
  tags = {
    Name = "main"
  }
}
resource "aws_ebs_volume" "vol" {
  availability_zone = "us-east-1a"
  size              = 8

  tags = {
     key_name = "ec2instance"
  }
}