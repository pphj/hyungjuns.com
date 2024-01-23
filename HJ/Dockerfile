FROM openjdk:17-ea-11-jdk-slim
COPY ./target/home-0.0.1-SNAPSHOT.war /security.war
COPY src/main/resources/static/image/aws.png /app/static/image/aws.png
COPY src/main/resources/static/image/logo.jpg /app/static/image/logo.jpg
COPY src/main/resources/static/image/spring.png /app/static/image/spring.png
COPY src/main/resources/static/image/study.jpg /app/static/image/study.jpg
ENTRYPOINT ["java", "-jar", "security.war"]
