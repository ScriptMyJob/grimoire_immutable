########################################
### Security Groups ####################
########################################

resource "aws_security_group" "sg1" {
    tags {
        Name = "SSH from work and Terraform server"
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
    }
    ingress {
        cidr_blocks = ["${lookup(var.config, "trusted_network")}", "${lookup(var.config, "terraform_server")}"]
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
    }
}
