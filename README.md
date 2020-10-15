# darrens-simple-webapp


A simple Java-based web application running on Tomcat for testing and demonstrations.

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/gitpod-io/darrens-simple-webapp)

## Compile and Deploy
Use Maven to build and deploy the webapp to Tomcat.
```
mvn package
```
## Run the web application
You can start and stop the Tomcat server using the following commands
```
tomcat/bin/startup.sh
tomcat/bin/shutdown.sh
```
To run the server inline within the terminal:
```
tomcat/bin/catalina.sh run
```
## Debug the web application
Run the following commands in a terminal and browse to the webapp as normal.
Although you shouldn't have to specify the env variables, it seems not to work otherwise.
The run the Debug (Attach) configuration.
```
export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket
tomcat/bin/catalina.sh jpda start
```
## Run the Java main program
```
mvn exec:java -Dexec.mainClass="com.thebroemmergroup.app.App"
```

