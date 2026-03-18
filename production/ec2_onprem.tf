data "aws_ami" "ubuntu_22_04" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "windows_server_2022" {
  most_recent = true
  owners      = ["801119661308"]

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "onprem_dc" {
  ami                         = data.aws_ami.windows_server_2022.id
  instance_type               = "t3.large"
  subnet_id                   = aws_subnet.onprem_public.id
  vpc_security_group_ids      = [aws_security_group.onprem.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.demo.key_name

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }

  tags = merge(local.common_tags, {
    Name = "onprem-domain-controller"
  })
}

resource "aws_instance" "onprem_standalone" {
  ami                         = data.aws_ami.ubuntu_22_04.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.onprem_public.id
  vpc_security_group_ids      = [aws_security_group.onprem.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.demo.key_name

  tags = merge(local.common_tags, {
    Name = "onprem-standalone-server"
  })
}
