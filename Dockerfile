FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY api-service/target/*.jar api-service.jar
COPY eureka-server/target/*.jar eureka-server.jar
COPY zuul-server/target/*.jar zuul-server.jar
COPY keycloak keycloak
COPY run.sh run.sh
RUN chmod u+x run.sh
CMD ./run.sh "java -jar eureka-server.jar" "java -jar zuul-server.jar" "./keycloak/bin/standalone.sh"; java -jar /api-service.jar