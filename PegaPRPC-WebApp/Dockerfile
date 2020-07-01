FROM busybox AS builder

# Expand prweb to target directory
COPY /resources/prweb.war /prweb.war
COPY /resources/prhelp.war /prhelp.war

RUN mkdir prweb
RUN unzip -q -o prweb.war -d /prweb

RUN mkdir prhelp
RUN unzip -q -o prhelp.war -d /prhelp

RUN wget https://jdbc.postgresql.org/download/postgresql-42.1.1.jar 

FROM pegasystems/pega-ready

# Import prweb to tomcat webapps directory
COPY --from=builder /prweb ${CATALINA_HOME}/webapps/prweb

# Import prhelp to tomcat webapps directory
COPY --from=builder /prhelp ${CATALINA_HOME}/webapps/prhelp

# Make a jdbc driver available to tomcat applications
COPY --from=builder postgresql-42.1.1.jar ${CATALINA_HOME}/lib/