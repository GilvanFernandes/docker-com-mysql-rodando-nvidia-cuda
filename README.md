
# Para criar um Dockerfile com o MySQL rodando em uma GPU NVIDIA, você pode seguir os seguintes passos:

Inicie o Dockerfile com a instrução FROM para especificar a imagem base do Docker que você deseja usar. Por exemplo:

## Funcionalidades

Rodar banco de dados MySQL em container (Docker) em processamento paralelo com as placas de vídeo da NVIDIA - CUDA 
Para criar um Dockerfile com o MySQL rodando em uma GPU NVIDIA, você pode seguir os seguintes passos:

Inicie o Dockerfile com a instrução FROM para especificar a imagem base do Docker que você deseja usar. Por exemplo:

```bash
FROM nvidia/cuda:10.1-base
```
Adicione as instruções necessárias para instalar o MySQL. Isso pode incluir coisas como adicionar repositórios de pacotes, instalar dependências e instalar o MySQL em si. Por exemplo:

```bash
RUN apt-get update && apt-get install -y mysql-server
```

Adicione as instruções para configurar o MySQL. Isso pode incluir coisas como definir senhas de usuário, criar bases de dados e conceder privilégios.

```bash

COPY my.cnf /etc/mysql/my.cnf

RUN service mysql start && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH PRIVILEGES;" && \
    mysql -u root -e "CREATE DATABASE test;"

```

Adicione as instruções para iniciar o MySQL quando o contêiner for iniciado. Isso pode ser feito usando a instrução CMD do Docker. Por exemplo:

```bash
CMD ["mysqld"]
```
Salve o arquivo como "Dockerfile" e construa a imagem do Docker usando o comando docker build.


Aqui está um exemplo de um Dockerfile completo que instala o MySQL em uma GPU NVIDIA e o inicia quando o contêiner é iniciado

```bash
FROM nvidia/cuda:10.1-base

RUN apt-get update && apt-get install -y mysql-server

COPY my.cnf /etc/mysql/my.cnf

RUN service mysql start && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH PRIVILEGES;" && \
    mysql -u root -e "CREATE DATABASE test;"


CMD ["mysqld"]
```
## Feedback

Se você tiver algum feedback, por favor nos deixe saber por meio do instagram https://www.instagram.com/ogilvanfernandes/


## Autor

- [@GilvanFernandes](https://www.github.com/GilvanFernandes)


## Referência

 - [Developer NVIDIA](https://developer.nvidia.com/)

## Contribuindo

Contribuições são sempre bem-vindas!

- Faça um fork do projeto
- Após a modificação faça um pull request ao projeto