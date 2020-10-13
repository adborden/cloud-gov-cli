FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y gnupg wget
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - && \
    echo "deb https://packages.cloudfoundry.org/debian stable main" > /etc/apt/sources.list.d/cloudfoundry-cli.list && \
    apt-get update && \
    apt-get install -y cf7-cli

COPY cf_setup.sh /usr/local/bin

ENTRYPOINT [ "cf_setup.sh" ]
CMD [ "-h" ]