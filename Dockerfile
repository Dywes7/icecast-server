# Imagem de Origem Docker Hub
FROM ubuntu:latest

# Atualização de repositórios e instalação Icecast
RUN apt update -y && apt upgrade -y && apt install icecast2 -y

# Criação do usuário icecast e adição ao grupo icecast
RUN useradd -r -g icecast icecast

# Copia do arquivo icecast.xml (SO pai) para dentro container
COPY icecast.xml /etc/icecast2/icecast.xml

# Mudar proprietário do arquivo xml
RUN chown icecast:icecast /etc/icecast2/icecast.xml

# Mudar proprietário da pasta de logs
RUN chown -R icecast:icecast /var/log/icecast2

# Indicação de que porta 8000 deverá estar escutando
EXPOSE 8000

# Alterar para usuário icecast
USER icecast

# Comando para iniciar o servidor Icecast
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
