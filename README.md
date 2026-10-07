# AWS re/Start — Laboratório 251: Scripts de Shell do Bash

## Sobre o laboratório

Neste laboratório do AWS re/Start, foi criado um **script Bash** para automatizar o backup da pasta `CompanyA`.

O script utiliza variáveis, data e hora do sistema e o comando `tar` para gerar automaticamente um arquivo compactado no formato:

```text
DATA-backup-CompanyA.tar.gz
```

O objetivo principal foi compreender como scripts Bash podem automatizar tarefas repetitivas no Linux.

## Objetivos

* Criar um script Bash.
* Tornar um script executável.
* Utilizar o shebang `#!/bin/bash`.
* Trabalhar com variáveis no Bash.
* Obter a data e a hora do sistema.
* Utilizar a variável `$USER`.
* Criar um backup compactado utilizando `tar`.
* Automatizar o processo de backup da pasta `CompanyA`.

## Ambiente utilizado

* AWS re/Start
* Vocareum
* Amazon Linux
* Amazon EC2
* SSH
* Windows
* PuTTY
* Chave `labsuser.ppk`
* Usuário: `ec2-user`

## Conexão com a instância

Neste laboratório, o acesso à instância EC2 foi realizado pelo Windows utilizando o PuTTY.

Configuração utilizada:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

Na configuração da autenticação do PuTTY, foi utilizada a chave:

```text
labsuser.ppk
```

Após estabelecer a conexão, o acesso foi realizado com o usuário:

```text
ec2-user
```

> A chave privada e o endereço IP público utilizados no laboratório não devem ser publicados no repositório.

---

## Task 1 — Conectar à instância EC2

Depois de iniciar o laboratório, foi obtido o endereço `PublicIP` e baixada a chave `labsuser.ppk`.

A conexão foi realizada utilizando o PuTTY.

A partir da conexão SSH, todas as atividades seguintes foram executadas na instância Amazon Linux.

---

## Task 2 — Criar um script Bash para backup

### 1. Verificar o diretório atual

Primeiro, foi utilizado o comando:

```bash
pwd
```

O resultado esperado é:

```text
/home/ec2-user/
```

Esse comando permite confirmar que estamos no diretório home do usuário.

### 2. Criar o arquivo do script

Foi criado o arquivo `backup.sh`:

```bash
touch backup.sh
```

### 3. Tornar o script executável

Em seguida, foram atribuídas permissões para permitir a execução do script:

```bash
sudo chmod 755 backup.sh
```

Com `755`, o proprietário possui permissões de leitura, escrita e execução, enquanto os demais usuários possuem leitura e execução.

### 4. Editar o script

O arquivo foi aberto utilizando o Vim:

```bash
vi backup.sh
```

O conteúdo utilizado no laboratório foi:

```bash
#!/bin/bash

DAY="$(date +%Y_%m_%d)"
BACKUP="/home/$USER/backups/$DAY-backup-CompanyA.tar.gz"

tar -csvpzf $BACKUP /home/$USER/CompanyA
```

### Entendendo o script

#### Shebang

```bash
#!/bin/bash
```

Indica que o script deve ser executado utilizando o Bash.

#### Variável `DAY`

```bash
DAY="$(date +%Y_%m_%d)"
```

Obtém a data atual e armazena o resultado na variável `DAY`.

O formato utilizado é:

```text
ANO_MÊS_DIA
```

Por exemplo:

```text
2022_05_18
```

#### Variável `BACKUP`

```bash
BACKUP="/home/$USER/backups/$DAY-backup-CompanyA.tar.gz"
```

Define o caminho e o nome do arquivo de backup.

A variável:

```bash
$USER
```

representa o usuário atualmente conectado. Neste laboratório, o usuário é:

```text
ec2-user
```

Assim, o backup será armazenado no diretório:

```text
/home/ec2-user/backups/
```

#### Criação do backup

```bash
tar -csvpzf $BACKUP /home/$USER/CompanyA
```

O comando `tar` é utilizado para criar o arquivo compactado contendo a pasta `CompanyA`.

As opções utilizadas são:

| Opção | Função                               |
| ----- | ------------------------------------ |
| `c`   | Cria um novo arquivo                 |
| `s`   | Trabalha com arquivos esparsos       |
| `v`   | Exibe informações durante a execução |
| `p`   | Preserva permissões                  |
| `z`   | Utiliza gzip para compactação        |
| `f`   | Define o arquivo de saída            |

---

## Executando o script

Depois de salvar o arquivo no Vim com:

```text
Esc
:wq
Enter
```

o script foi executado com:

```bash
./backup.sh
```

Durante a execução, o `tar` exibe os arquivos e diretórios que estão sendo incluídos no backup.

Entre eles estão:

```text
/home/ec2-user/CompanyA/
/home/ec2-user/CompanyA/Management/
/home/ec2-user/CompanyA/Management/Sections.csv
/home/ec2-user/CompanyA/Management/Promotions.csv
/home/ec2-user/CompanyA/Employees/
/home/ec2-user/CompanyA/Employees/Schedules.csv
/home/ec2-user/CompanyA/Finance/
/home/ec2-user/CompanyA/Finance/Salary.csv
/home/ec2-user/CompanyA/HR/
/home/ec2-user/CompanyA/HR/Managers.csv
/home/ec2-user/CompanyA/HR/Assessments.csv
/home/ec2-user/CompanyA/IA/
/home/ec2-user/CompanyA/SharedFolders/
```

A mensagem:

```text
tar: Removing leading `/' from member names
```

indica que o `tar` remove a `/` inicial dos caminhos absolutos ao armazená-los no arquivo.

---

## Verificando o backup

Para verificar se o arquivo foi criado no diretório `backups`, foi utilizado:

```bash
ls backups/
```

O resultado apresenta um arquivo semelhante a:

```text
2022_05_18_05:55:28_05_55-backup-CompanyA.tar.gz
```

O nome exato depende da data e hora utilizadas durante a execução do script.

---

## Conceitos praticados

### Scripts Bash

Um script Bash permite colocar vários comandos em um arquivo e executá-los como uma única tarefa.

### Variáveis

O laboratório utilizou variáveis para armazenar informações:

```bash
DAY="..."
BACKUP="..."
```

### Substituição de comandos

O comando:

```bash
$(date +%Y_%m_%d)
```

permite executar `date` e utilizar o resultado dentro da variável.

### Variável `$USER`

A variável:

```bash
$USER
```

identifica o usuário atualmente conectado.

### Permissões

O comando:

```bash
chmod 755 backup.sh
```

torna o script executável.

### Backup com `tar`

O comando `tar` permite reunir a estrutura de diretórios e arquivos em um único arquivo, utilizando gzip para compactação neste laboratório.

---

## Automatização

Um script desse tipo pode ser utilizado para automatizar tarefas recorrentes de backup.

O próprio laboratório menciona que esse processo pode ser agendado utilizando o **cron**, permitindo executar o backup diariamente.

Também é possível utilizar outros comandos para copiar o arquivo de backup para outros servidores, embora essa parte esteja fora do escopo deste laboratório.

---

## O que foi aprendido

Neste laboratório, foram praticados:

* Criação de scripts Bash.
* Shebang.
* Variáveis no Bash.
* Substituição de comandos.
* Variável `$USER`.
* Permissões de execução com `chmod`.
* Utilização do `vi`.
* Criação de backups com `tar`.
* Compactação com gzip.
* Organização automática do nome dos backups utilizando data e hora.
* Execução de scripts com `./`.

## Conclusão

O laboratório demonstrou como o Bash pode ser utilizado para automatizar tarefas administrativas no Linux.

A criação do `backup.sh` permitiu transformar um conjunto de comandos de backup em um processo automatizado, utilizando variáveis e informações do próprio sistema para gerar o nome e o local do arquivo de backup.

## Arquivos do repositório

```text
├── README.md       # Documentação do laboratório
├── comandos.sh     # Comandos praticados durante o laboratório
└── .gitignore      # Arquivos que não devem ser enviados ao Git
```

> Nenhuma chave privada, credencial ou endereço IP utilizado no ambiente do laboratório deve ser incluído neste repositório.
