FROM nginx:alpine
LABEL maintainer="Jonathan Duval <jonathan.duval@cheerz.com>"

# Add the whole repo.
ADD ./conf/nginx-default.conf /etc/nginx/conf.d/default.conf


EXPOSE 80