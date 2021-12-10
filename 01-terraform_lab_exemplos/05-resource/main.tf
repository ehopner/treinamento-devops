# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "web" {
#   ami           = "ami-09e67e426f25ce0d7"
#   instance_type = "t2.micro"
#   subnet_id              = "subnet-eddcdzz4"
#   # availability_zones = ["us-east-1"] # configurando zona para criar maquinas
#   tags = {
#     Name = "Minha Maquina Simples EC2"
#   }
#   volume_id = aws_ebs_volume.itau_volume_encrypted.id
# }


# resource "aws_ebs_volume" "itau_volume_encrypted" {
#   size      = 8
#   encrypted = true
#   tags      = {
#     Name = "Volume itaú"
#   }
# }



##### Caso Itaú #####
# aws configure # maquina pessoal
# nas do itaú colocar as variáveis de ambiente no bashrc
# https://docs.aws.amazon.com/sdkref/latest/guide/environment-variables.html
# configurar via environment variable
# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""
# export AWS_DEFAULT_REGION=""

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "web" {
#   ami = "ami-09e67e426f25ce0d7"
#   instance_type = "t3.micro"
#   subnet_id = "subnet-05880ea9006199004"
  
#   tags = {
#     Name = "MinhaPrimeiraMaquina-Carol  "
#   }
# }

# resource "aws_ebs_volume" "itau_volume_encrypted" {
#   size      = 8
#   encrypted = true
#   availability_zone = "us-east-1a"
#   tags      = {
#     Name = "Volume itaú"
#   }
# }

# resource "aws_volume_attachment" "ebs_att" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.itau_volume_encrypted.id
#   instance_id = aws_instance.web.id
# }

# Gamaacademythree-sbx - # passago a chave pelo pessoal de segurança itaú
# export AWS_ACCESS_KEY_ID="3232323232"
# export AWS_SECRET_ACCESS_KEY="34433444sssdd3+ssa/dd434343"

# //////

# ///////// do fernando zerati //////


# # Forma grande
# resource "local_file" "map_files" {
#   count = length(keys(var.arquivos))
#   filename = "${keys(var.arquivos)[count.index]}.txt"
#   content = var.arquivos[keys(var.arquivos)[count.index]]
# }

# variable "subnet" {
#   type        = string
#   description = "Qual a subnet?"
# }

# variable "ami" {
#   type        = string
#   description = "Qual é a AMI?"
# }

# variable "securityGroup" {
#   type        = string
#   description = "Qual é o SecurityGroup?"
# }

# variable "instanceType" {
#   type        = string
#   description = "Qual é o InstanceType?"
# }


# variable "arquivos" {
#   default     = {
#     ehopner1 = "ehopner-maquina-1",
#     ehopner2 = "ehopner-maquina-2",
#     ehopner3 = "ehopner-maquina-3"
#   }
# }


provider "aws" {
  region = "sa-east-1"
}

# resource "aws_instance" "web2" {
#   subnet_id = "${var.subnet}"  #"subnet-0c5a2d7f680727736"
#   ami = "${var.ami}" #"ami-0e66f5495b4efdd0f"
#   instance_type = "${var.instanceType}" #"t2.large"
#   ##count = length(keys(var.arquivos))
#   key_name = "ehopner-dev" # a chave que vc tem na maquina pessoal
#   associate_public_ip_address = true
#   vpc_security_group_ids = ["${var.securityGroup}"]#["sg-05e0f6eddc0bbe551"]
#   root_block_device {
#     encrypted = true
#     volume_size = 8
#   }
#   tags = {
#     Name = "ec2-ehopner-tf-teste"
#   }
# }

# output "instance_public_dns" {
#   value = [
#     aws_instance.web2.public_dns
#   ]
#   description = "Mostra o DNS Publico"
# }

# output "instance_public_ip" {
#   value = [
#     aws_instance.web2.public_ip
#   ]
#   description = "Mostra o IP Publico"
# }

resource "aws_key_pair" "chave_key" {
  key_name   = "chave_key_gerada"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDXMoVhR9eNr5JzSYLy2r7S5emAkThJpMUyNNqv+HSEc6qSKMVY+R76lqhnPXQ2rpTWb18r27zTaD7bb+++9R+0qijzCswnDKfh8zY6EXRlnYcnPJ/eP6TAkm0d8LmoGBdDZwpUJCOtQy/5BO3Mw+qDcKKpPAYU4AKWfOx8rSsCLauzH7AQN+Vjeh5cPLXjaHC56f5BJC55iTC3bdaLT/KVAMs+0XFzwH1l8lAMqqsuUeQs8jomGNVPS0BXFJed+GOVLbwFHejzR0R4Aj/4TLWLoTz+UsXFK55qUJNb6VSIIYT4RF7ZzJVf+d+n5Ea1aMsb9OLMGd6FwgQPqTkyYtVdlkaWFW90gCgW3LHwwp1mCRqqFGDBDlaROJvn7AvK24zy3tlOM5pMljseg+yNfZRlIFqkkXWmxd+ZfApDOKq1FM/mnD5wLECmBept7aV3TECmDGW16nfdLGnjIpdfwQPzMwtZk5ZNdsgCrYaoIba4/97pioZKpB/DsezB0P2sbW8= ubuntu@ip-10-10-192-193"
  }


# /////

# aws_instance.web.public_id