FROM bmeng/hello-openshift

RUN opkg-install ca-certificates
RUN rm -rf /tmp/* || true
RUN echo 'export SSL_CERT_DIR=/etc/ssl/certs' >> /etc/profile

EXPOSE 8080 8888
ENTRYPOINT ["/hello-openshift"]
