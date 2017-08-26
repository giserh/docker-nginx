FROM alpine
RUN apk update
RUN apk add nginx
RUN rm /etc/nginx/conf.d/*
VOLUME /var/log/nginx
VOLUME /var/www/dl
EXPOSE 80
EXPOSE 443
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off; pid off;"]
COPY nginx.conf /etc/nginx/nginx.conf
COPY sites/* /etc/nginx/conf.d/
