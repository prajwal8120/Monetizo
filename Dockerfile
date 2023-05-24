FROM tomcat:8
COPY /harness/target/dockeransible.war /usr/local/tomcat/webapps/my-app.war
CMD ["catalina.sh", "run"]
EXPOSE 8080
