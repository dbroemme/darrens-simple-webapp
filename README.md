# darrens-simple-webapp

A simple Java-based web application for testing and demonstrations.

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/gitpod-io/darrens-simple-webapp)

## Running the web application
Tomcat is used to run the Java webapp. You can start and stop the server using the following commands
```
tomcat/bin/startup.sh
tomcat/bin/shutdown.sh
```
To run the server inline within the terminal:
```
tomcat/bin/catalina.sh run
```
To debug the webapp, run the following commands in a termainal and browse to the webapp like normal.
Although you shouldn't have to specify the env variables, it seems not to work otherwise.
The run the Debug (Attach) configuration.
```
export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket
tomcat/bin/catalina.sh jpda start
```
## Running a Java main
```
mvn exec:java -Dexec.mainClass="com.thebroemmergroup.app.App"
```