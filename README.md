## 🖥️ Como Usar

1.  Clone este repositório:

    `git clone https://github.com/lucasgmarques/terraform-appsmith.git
    cd terraform-appsmith` 
   
2.  Inicialize o Terraform:
    
    `terraform init` 
    
3.  Valide a configuração:
    
    `terraform validate` 
    
4.  Planeje o provisionamento:

    `terraform plan` 
    
5.  Execute o provisionamento:
    
    `terraform apply` 
    
6.  Após a conclusão, execute o comando abaixo do Ansible para instalar as roles necessárias para o provisionamento do serviço do Appsmith via docker compose:

	`ansible-galaxy install -r requirements.yml`
	
7. Logo após, execute o playbook do Ansible para provisionar o container do Appsmith:

	`ansible-playbook -i inventory.ini playbook.yaml`

8. Após a conclusão, o Appsmith estará disponível no endereço:
	`http://localhost`

## 🧹 Como Remover a Infraestrutura

Para destruir todos os recursos criados, execute:

`terraform destroy`
