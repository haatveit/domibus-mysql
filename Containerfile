FROM docker.io/alpine AS sql-scripts

ARG DOMIBUS_SQL_SCRIPTS_VERSION=1.14

RUN wget https://ec.europa.eu/digital-building-blocks/artifact/repository/eDelivery/eu/domibus/domibus-msh-sql-distribution/${DOMIBUS_SQL_SCRIPTS_VERSION}/domibus-msh-sql-distribution-${DOMIBUS_SQL_SCRIPTS_VERSION}.zip

RUN unzip domibus-msh-sql-distribution-${DOMIBUS_SQL_SCRIPTS_VERSION}.zip

FROM docker.io/mysql:8

ENV DOMIBUS_VERSION=5.1.9
ENV MYSQL_DATABASE=domibus
ENV MYSQL_USER=edelivery
ENV MYSQL_PASSWORD=edelivery

COPY --from=sql-scripts /sql-scripts/${DOMIBUS_VERSION}/mysql /domibus
COPY domibus-initdb.sh /docker-entrypoint-initdb.d/
