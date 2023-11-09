FROM confluentinc/cp-kafka-connect-base:7.5.2

ENV CLICKHOUSE_CONNECTOR_VERSION=v1.0.1
RUN wget -q -O /tmp/clickhouse-kafka-connect.zip https://github.com/ClickHouse/clickhouse-kafka-connect/releases/download/${CLICKHOUSE_CONNECTOR_VERSION}/clickhouse-kafka-connect-${CLICKHOUSE_CONNECTOR_VERSION}.zip

ENV JDBC_CONNECTOR_VERSION=10.7.2

RUN set -xe && \
  confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:${JDBC_CONNECTOR_VERSION} && \
  confluent-hub install --no-prompt /tmp/clickhouse-kafka-connect.zip
