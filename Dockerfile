FROM nginx

# Copiar el archivo de configuración personalizado
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# CMD para configurar Nginx con las variables de entorno y luego iniciarlo
CMD envsubst '$$BACKEND_SERVERS' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'