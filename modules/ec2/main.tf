resource "aws_instance" "web" {
  count         = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = element(var.subnet_ids, count.index)
  vpc_security_group_ids = [var.security_group_id]
  user_data     = file("${path.module}/user_data.sh")

  tags = { Name = "${var.project}-ec2-${count.index + 1}" }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
