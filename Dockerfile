FROM maven:3.8.4-jdk-11 as build
WORKDIR /app
COPY app /app
RUN mvn clean package

FROM tomcat:9.0-slim
COPY flag /flag
EXPOSE 8080
COPY --from=build /app/target/helloworld.war $CATALINA_HOME/webapps
