FROM tomcat:8
COPY */target/dockeransible.war /usr/local/tomcat/webapps/my-app.war
CMD ["catalina.sh", "run"]
EXPOSE 8080
