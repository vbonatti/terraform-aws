resource "aws_security_group" "acesso-ssh" { //Criando security group
    name = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        #Please restrict your ingress to only necessary IP's and ports
        #Opening to 0.0.0.0/0 can lead to security vulnerabilities
        cidr_blocks = var.cdirs_acesso_remoto //usando variaveis
    }
    tags = {
      Name = "ssh"
    }
}

//SG para a regiao us-east-2
resource "aws_security_group" "acesso-ssh-us-east-2" { //Colocar outro nome 
    provider = aws.us-east-2//colocar o provider para a nova região
    name = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        #Please restrict your ingress to only necessary IP's and ports
        #Opening to 0.0.0.0/0 can lead to security vulnerabilities
        cidr_blocks = ["189.101.170.208/32"] //seu ip
    }
    tags = {
      Name = "ssh"
    }
}