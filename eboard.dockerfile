FROM openjdk:17-jdk-alpine
WORKDIR /web
COPY ./eBoard-2.1.jar eboard.jar
ENTRYPOINT ["java","-jar","eboard.jar"]