variable "amis" {//variavel para pegar imagens "iso"
    type = map
    default = {
        amazon-linux-us-east-2 = "ami-02d1e544b84bf7502"
    }
}

variable "cdirs_acesso_remoto" {//Variavel liberação de ip
    type = list
    default = ["189.101.170.208/32"]
}

variable "key_name" {//Variavel para Chave
    default = "terraform"
}

variable "type_free_tier" {//Tipo de maquina
    default = "t2.micro"
}