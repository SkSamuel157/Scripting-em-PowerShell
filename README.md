### **Parte 01**


# Automação de Criação de Usuários e Grupos no Active Directory

## Descrição

Este projeto tem como objetivo automatizar o processo de criação de usuários e grupos no Active Directory (AD) utilizando um script PowerShell. O script facilita a criação de usuários com base em um arquivo CSV, a atribuição de senhas temporárias e a inclusão dos usuários em grupos específicos. Além disso, garante que a troca de senha seja forçada no primeiro login.

## Requisitos

1. **Criar 20 usuários no Active Directory** seguindo o padrão `nome.sobrenome`.
2. **Criar cinco grupos distintos**: TI, Comercial, Financeiro, Compras, Produção.
3. **Distribuir automaticamente os usuários entre os grupos** com base nos dados fornecidos no arquivo CSV.
4. **Atribuir a todos os usuários uma senha inicial temporária** e obrigar a troca no primeiro login.
5. **Validar a criação dos usuários e garantir que cada um foi corretamente alocado ao grupo correspondente**.

## Estrutura do Projeto

### **1. Arquivo CSV (lista.csv)**

O arquivo CSV contém as informações dos usuários e os grupos aos quais eles pertencem. O formato do arquivo é:

```csv
carlos_silva;TI
ana_souza;Comercial
bruno_costa;Financeiro
mariana_ferreira;Compras
fernanda_oliveira;Producao
ricardo_martins;TI
```

Cada linha segue o padrão `nome.sobrenome;grupo`.

### **2. Script PowerShell (Criar.ps1)**

O script PowerShell `Criar.ps1` é responsável pela criação dos usuários no Active Directory, atribuição de senha temporária e adição aos grupos.

### **Exemplo de Saída no PowerShell**

O script exibe mensagens de sucesso ou erro conforme a execução, como:

```
Usuário carlos_silva criado com sucesso.
Usuário carlos_silva adicionado ao grupo TI com sucesso.
Usuário carlos_silva está corretamente no grupo TI.
```

## OBS:
Pedi pro GPT Fazer a Documentação (Não tive tempo de fazer desculpa)
