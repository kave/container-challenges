FROM nginx:1-alpine

COPY nginx.conf /etc/nginx/nginx_base.conf

ARG CONTAINER_INTEGER

RUN envsubst '$CONTAINER_INTEGER' < /etc/nginx/nginx_base.conf > /etc/nginx/nginx.conf