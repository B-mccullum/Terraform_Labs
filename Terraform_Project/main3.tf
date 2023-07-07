resource "aws_instance" "ubuntu" {
  instance_type          = var.instance_type
  ami                    = var.instance_ami
  vpc_security_group_ids = [aws_security_group.wk_20_secgr.id]
  tags = {
    Name = "wk_20_jenkins_instance"
  }

  user_data = file("script.sh")
}


resource "aws_security_group" "wk_20_secgr" {
  name        = "wk_20_secgr"
  description = "Allow incoming traffic on port 22,8080, and 443"
  vpc_id      = var.default_vpc_id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "incoming 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "incoming 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "wk_20_jenkins_artifacts" {
  bucket = "wk-20-jenkins-artifacts-${random_id.randomness.hex}"

  tags = {
    Name = "wk-20-jenkins-artifacts"
  }
}

resource "random_id" "randomness" {
  byte_length = 10
}
