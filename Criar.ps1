# Le Arquivo 
Get-Content .\lista.csv | ForEach-Object {
    # Divide por ponto e vírgula
    $dados = $_ -split ";"
    
    # Extrai o nome completo e o grupo
    $nome = $dados[0]
    $grupo = $dados[1]

    # Criação do usuário
    New-ADUser -Name $nome  -SamAccountName $nome -UserPrincipalName "$nome@host.one" -GivenName ($nome.Split("_")[0]) -Surname ($nome.Split("_")[1]) -AccountPassword (ConvertTo-SecureString "Senha123" -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true -Description "Usuário $nome"
    Write-Host "Usuário $nome criado com sucesso."
    # Adiciona o usuário ao grupo correspondente
    Try {
        Add-ADGroupMember -Identity $grupo -Members $nome
        Write-Host "Usuário $nome adicionado ao grupo $grupo com sucesso." 
    }
    Catch {
        Write-Host "Erro ao adicionar o usuário $nome ao grupo $grupo.: $_" 
    }

    # Valida se o usuário foi adicionado ao grupo
    Try {
        # Verifica se o usuário está no grupo
        $grupoMembros = Get-ADGroupMember -Identity $grupo
        if ($grupoMembros | Where-Object { $_.SamAccountName -eq $nome }) {
            Write-Host "Usuário $nome está corretamente no grupo $grupo." 
        }
        else {
            Write-Host "Erro: Usuario $nome não encontrado no grupo $grupo." 
        }
    }
    Catch {
        Write-Host "Erro ao verificar o grupo $grupo para o usuário $nome.: $_" 
    }
}
