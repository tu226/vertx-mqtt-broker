FROM java:8-alpine

WORKDIR /opt

ADD target/vertx-mqtt-broker-2.2.5-fat.jar mqtt-broker.jar
ADD config.json config.json

ENTRYPOINT ["java", "-jar", "-XX:OnOutOfMemoryError=\"kill -9 %p\"", "-XX:+UseG1GC", "mqtt-broker.jar"]
CMD ["-c","/opt/config.json"]
