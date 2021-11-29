FROM openjdk:17-jdk-alpine
WORKDIR /web
COPY ./eBoard-3.0.jar eboard.jar
ENTRYPOINT ["java","-jar","eboard.jar"]