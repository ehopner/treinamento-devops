variable "arquivos" {
  default     = {
    ehopner1 = "ehopner-maquina-1",
    ehopner2 = "ehopner-maquina-2",
    ehopner3 = "ehopner-maquina-3"
  }
}

# Forma grande
resource "local_file" "map_files" {
  count = length(keys(var.arquivos))
  filename = "${keys(var.arquivos)[count.index]}.txt"
  content = var.arquivos[keys(var.arquivos)[count.index]]
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web2-agora-vai" {
  subnet_id = "subnet-0c5a2d7f680727736"
  ami = "ami-0e66f5495b4efdd0f"
  count = length(keys(var.arquivos))
  instance_type = "t2.micro"
  key_name = "ehopner-dev" # a chave que vc tem na maquina pessoal
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-05e0f6eddc0bbe551"]
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ehopner-iterativo-ec2-${var.arquivos[keys(var.arquivos)[count.index]]}"
  }
}