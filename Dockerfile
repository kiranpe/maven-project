FROM tomcat

COPY tomcatxmls/tomcat-users.xml /usr/local/tomcat/conf/

COPY tomcatxmls/context.xml /usr/local/tomcat/webapps/manager/META-INF/

ADD  webapp/target/webapp.war /usr/local/tomcat/webapps/ 
