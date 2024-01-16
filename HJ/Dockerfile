FROM openjdk:17-ea-11-jdk-slim
COPY ./target/home-0.0.1-SNAPSHOT.war /security.war
COPY src/main/resources/static/image/gross.jpg /app/static/image/gross.jpg
COPY src/main/resources/static/image/logo.jpg /app/static/image/logo.jpg
COPY src/main/resources/static/image/sayles.jpg /app/static/image/sayles.jpg
COPY src/main/resources/static/image/vinh.jpg /app/static/image/vinh.jpg
ENTRYPOINT ["java", "-jar", "security.war"]
