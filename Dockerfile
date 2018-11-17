FROM ubuntu:latest

COPY ./mibbrowser /opt/mibbrowser

RUN apt-get update &&\
    apt-get install -y openjdk-8-jre snmp &&\
    rm -rf /var/lib/apt/lists/*

RUN adduser --home /home/ireasoning --uid 1000 --gecos '' --disabled-password ireasoning

RUN chown -R ireasoning:ireasoning /opt/mibbrowser

USER ireasoning
WORKDIR /home/ireasoning
CMD ["/opt/mibbrowser/browser.sh"]