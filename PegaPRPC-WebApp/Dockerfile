FROM busybox AS builder

# Expand prweb to target directory
COPY /resources/prweb.war /prweb.war
RUN mkdir prweb
RUN unzip -q -o prweb.war -d /prweb
RUN wget https://jdbc.postgresql.org/download/postgresql-42.1.1.jar 

FROM pegasystems/pega-ready

# Import prweb to tomcat webapps directory
COPY --from=builder /prweb ${CATALINA_HOME}/webapps/prweb

# Make a jdbc driver available to tomcat applications
COPY --from=builder postgresql-42.1.1.jar ${CATALINA_HOME}/lib/