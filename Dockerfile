FROM alpine:latest

RUN apk update
RUN apk add bash curl libc-utils libcurl libgcc wget nmap-ncat openssl libssl1.0 nss ca-certificates mtr iputils
RUN rm -rf /tmp/* || true
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
COPY bin/ws /usr/bin/ws
COPY bin/hello-openshift /hello-openshift
ADD ca.pem /usr/local/share/ca-certificates/test-example.pem
ADD ca.pem /tmp/ca.pem
RUN update-ca-certificates

EXPOSE 8080 8888
ENTRYPOINT ["/hello-openshift"]
