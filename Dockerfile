FROM resin/rpi-raspbian:jessie

MAINTAINER Pascal Cremer "b00gizm@gmail.com"

ENV NGINX_VERSION 1.6.2-5

RUN apt-get update && \
    apt-get install -y nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

