# syntax=docker/dockerfile:1

FROM ruby:3.3.4
LABEL maintainer="tobias.michaelsen@gmail.com"

ENV ORACLE_HOME="/usr/lib/oracle/19.24/client64"
ENV LD_LIBRARY_PATH="$ORACLE_HOME/lib"
ENV PATH="$PATH:$ORACLE_HOME/bin"
ENV APP_HOME="/usr/src/app"
ENV TNS_ADMIN="/usr/tns_credentials"

COPY ./tns_credentials $TNS_ADMIN

COPY \
  vendor/19.24/oracle-instantclient*-basiclite-*.rpm \
  vendor/19.24/oracle-instantclient*-devel-*.rpm \
  vendor/19.24/oracle-instantclient*-sqlplus-*.rpm \
  /tmp/

RUN set -ex && \
  BUILD_PACKAGES='alien build-essential libaio-dev' && \
  apt-get update && \
  apt-get install -y --no-install-recommends $BUILD_PACKAGES libaio1 && \
  for f in /tmp/oracle-*.rpm; do alien -i $f; done && \
  apt-get purge -y --auto-remove $BUILD_PACKAGES && \
  rm -rf /tmp/*.rpm && \
  echo /usr/lib/oracle/19.24/client64/lib > /etc/ld.so.conf.d/oracle-instantclient19.24.conf && \
  ldconfig

WORKDIR $APP_HOME

EXPOSE 3000

CMD ["sh"]