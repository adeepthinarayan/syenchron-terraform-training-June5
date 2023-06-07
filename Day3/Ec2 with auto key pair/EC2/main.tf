resource "tls_private_key" "my_key" {
  algorithm = "RSA"
}

resource "local_file" "myterraformkey" {
  filename = "myterraformkey.pem"
  content = tls_private_key.my_key.private_key_pem
}

resource "aws_key_pair" "public_key" {
  key_name = "myterraformkey"
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "aws_default_vpc" "default_vpc" {
  
}

data "aws_subnets" "default_subnet" {
  filter{
    name = "vpc-id"
    values = [aws_default_vpc.default_vpc.id]
  }
}

resource "aws_security_group" "thinknyxSG" {
  name = "thinknyxSG"
  vpc_id = aws_default_vpc.default_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-*-amd64-server-*"]
  }
}

resource "aws_instance" "myinstance" {
  ami               =  data.aws_ami_ids.ubuntu.ids[1]
  instance_type     = var.instancetype
  availability_zone = var.az
  vpc_security_group_ids = [ aws_security_group.thinknyxSG.id ]
  subnet_id = data.aws_subnets.default_subnet.ids[2]
  tags = {
    Name = var.instancename
  }
  # Public Key
  key_name = "myterraformkey"

  connection {
    type = "ssh"
    user = "ubuntu"
    host = self.public_ip
    private_key = file(var.aws_key)
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt install apache2 -y",
      "sudo systemctl start apache2",
      "echo Hope you are all enjoying the session!! | sudo tee /var/www/html/index.html"
     ]
  }
}