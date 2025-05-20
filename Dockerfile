FROM nginx:alpine

# Substitui a configuração padrão do Nginx para usar a porta 8080
RUN sed -i 's/listen\s*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Copia arquivos estáticos (se necessário)
COPY index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expõe a porta 8080 (obrigatório para Cloud Run)
EXPOSE 8080
