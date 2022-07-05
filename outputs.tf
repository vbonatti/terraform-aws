//Informa no plan as saidas do output como no exemplo abaixo mostra o ip publico da ec2 dev5
output "ip_dev5" {
    value = aws_instance.dev5.public_ip
}