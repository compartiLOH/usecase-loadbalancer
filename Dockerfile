# Utilizamos la imagen oficial de Nginx desde Docker Hub
FROM nginx

# Copiamos el archivo de configuración personalizado para el balanceador de carga
COPY nginx.conf /etc/nginx/nginx.conf