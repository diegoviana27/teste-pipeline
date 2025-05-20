# Use a imagem base do Nginx
FROM nginx:alpine

# Copie os arquivos de configuração ou página para o contêiner
COPY ./index.html /usr/share/nginx/html/index.html

# Exponha a porta do Nginx (porta 80)

EXPOSE 80
