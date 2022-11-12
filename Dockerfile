FROM openjdk:11
EXPOSE 9000
ADD ./target/gs-spring-boot-0.1.0.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
