FROM tomcat
WORKDIR "/app"

RUN apt-get update
RUN apt-get install git -y
RUN apt-get install default-jdk -y
RUN apt-get install maven -y

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello

WORKDIR "/app/boxfuse-sample-java-war-hello"

RUN mvn package -am -Dmaven.test.skip -T 1C
RUN cp hello-1.0 /var/lib/tomcat10/webapps/hello-1.0