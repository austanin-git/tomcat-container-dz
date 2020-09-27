FROM tomcat

RUN apt-get update && apt-get -y upgrade
RUN apt-get install git -y
RUN apt-get install maven -y

WORKDIR /app/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /app/boxfuse-sample-java-war-hello

RUN mvn package -am -Dmaven.test.skip -T 1C
RUN cp /app/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war

EXPOSE 8080