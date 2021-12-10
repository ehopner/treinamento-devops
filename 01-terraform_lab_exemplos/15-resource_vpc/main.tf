provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web-a" {
  subnet_id     = aws_subnet.subnetA.id   #"subnet-0c5a2d7f680727736"
  ami           = "ami-0e66f5495b4efdd0f" #"${var.ami}" #"ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"              #"${var.instanceType}" #"t2.large"
  ##count = length(keys(var.arquivos))
  key_name                    = "ehopner-dev" # a chave que vc tem na maquina pessoal
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh1.id] #["sg-05e0f6eddc0bbe551"]
  root_block_device {
    encrypted   = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-ehopner-tf-teste-a"
  }
}

resource "aws_instance" "web-c" {
  subnet_id     = aws_subnet.subnetC.id   #"subnet-0c5a2d7f680727736"
  ami           = "ami-0e66f5495b4efdd0f" #"${var.ami}" #"ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"              #"${var.instanceType}" #"t2.large"
  ##count = length(keys(var.arquivos))
  key_name                    = "ehopner-dev" # a chave que vc tem na maquina pessoal
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh1.id] #["sg-05e0f6eddc0bbe551"]
  root_block_device {
    encrypted   = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-ehopner-tf-teste-c"
  }
}


output "name" {
  value       = aws_vpc.vpc.id
  description = "value"
}
