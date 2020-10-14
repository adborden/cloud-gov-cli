FROM alpine:3.12

RUN apk update && apk add curl
RUN curl -Ls 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v7&source=github'  \
    | tar -C /usr/local/bin -zvx cf cf7
COPY cf_setup.sh /usr/local/bin

ENTRYPOINT [ "cf_setup.sh" ]
CMD [ "-h" ]