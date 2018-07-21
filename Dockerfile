FROM alpine

RUN apk --update add apache2 apache2-ssl apache2-proxy apache2-radius; \
mkdir /var/run/apache2; mkdir /etc/apache2/proxy;\
echo "LoadModule slotmem_shm_module modules/mod_slotmem_shm" >> /etc/apache2/httpd.conf ;\
echo "IncludeOptional /etc/apache2/proxy" >> /etc/apache2/httpd.conf ;\
rm /etc/apache2/conf.d/mod-auth-radius.conf

CMD "httpd -DFOREGROUND"