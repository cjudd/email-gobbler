FROM java:openjdk-6

ENV JAMES_DOMAIN localhost
ENV JAMES_USER test@localhost
ENV JAMES_PASSWORD test

ENV JAMES_HOME /usr/local/james
ENV JAMES_VERSION 3.0beta4
ENV JAMES_NAME apache-james-3.0-beta4
ENV JAMES_DIR $JAMES_NAME
ENV JAMES_TGZ_FILE $JAMES_NAME-app.tar.gz

# http://www.apache.org/dist/james/apache-james/3.0beta4/apache-james-3.0-beta4-app.tar.gz
ENV JAMES_TGZ_URL http://www.apache.org/dist/james/apache-james/$JAMES_VERSION/$JAMES_TGZ_FILE


RUN apt-get update && apt-get --yes install procps libc6-i386 libc6-dev-i386

RUN curl -fSL "$JAMES_TGZ_URL" -o james.tar.gz
RUN tar -xvf james.tar.gz
RUN mv $JAMES_NAME /usr/local/james
RUN rm james.tar.gz

WORKDIR $JAMES_HOME/bin

#RUN ./james start
#RUN ./james-cli.sh -h localhost adddomain $JAMES_DOMAIN
#RUN ./james-cli.sh -h localhost adduser $JAMES_USER $JAMES_PASSWORD

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 25
EXPOSE 110
EXPOSE 143
