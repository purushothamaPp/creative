FROM tomcat:8
LABEL app=my-app
COPY target/*.war /usr/local/tomcat/webapps/simple-app-3.0.0.war
