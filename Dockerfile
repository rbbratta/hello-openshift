FROM bmeng/hello-openshift

RUN opkg-install wget
RUN rm -rf /tmp/* || true

EXPOSE 8080 8888
ENTRYPOINT ["/hello-openshift"]
