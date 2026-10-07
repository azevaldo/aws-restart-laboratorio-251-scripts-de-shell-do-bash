```bash
#!/bin/bash

# AWS re/Start - Laboratório 251
# Scripts de Shell do Bash
#
# Este arquivo documenta os principais comandos utilizados
# durante o laboratório.
#
# A conexão com a instância foi realizada no Windows
# utilizando PuTTY e a chave labsuser.ppk.
#
# Os comandos abaixo são uma referência dos procedimentos
# realizados e não devem necessariamente ser executados
# todos de uma vez.


# ============================================================
# 1. Verificar o diretório atual
# ============================================================

pwd


# ============================================================
# 2. Criar o arquivo do script
# ============================================================

touch backup.sh


# ============================================================
# 3. Tornar o script executável
# ============================================================

sudo chmod 755 backup.sh


# ============================================================
# 4. Abrir o script para edição
# ============================================================

vi backup.sh


# Dentro do Vim, o conteúdo utilizado foi:
#
# #!/bin/bash
#
# DAY="$(date +%Y_%m_%d)"
# BACKUP="/home/$USER/backups/$DAY-backup-CompanyA.tar.gz"
#
# tar -csvpzf $BACKUP /home/$USER/CompanyA
#
# Para salvar e sair:
#
# Esc
# :wq
# Enter


# ============================================================
# 5. Executar o script
# ============================================================

./backup.sh


# ============================================================
# 6. Verificar o arquivo de backup criado
# ============================================================

ls backups/


# ============================================================
# Observação
# ============================================================
#
# O script cria um backup da pasta CompanyA no diretório:
#
# /home/$USER/backups/
#
# O nome do arquivo segue o formato:
#
# DATA-backup-CompanyA.tar.gz
#
# Exemplo:
#
# 2022_05_18_05:55:28_05_55-backup-CompanyA.tar.gz
#
# A data e a hora reais dependem do momento em que o script
# for executado.
#
# ============================================================


# Referência: conexão SSH utilizando OpenSSH/PEM.
# NÃO foi o método utilizado neste laboratório no Windows.
#
# chmod 400 labsuser.pem
# ssh -i labsuser.pem ec2-user@<public-ip>
#
# No laboratório, a conexão real foi feita com:
# PuTTY + labsuser.ppk + SSH + porta 22.
```
