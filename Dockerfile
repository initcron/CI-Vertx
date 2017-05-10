FROM schoolofdevops/voteapp-mvn:v0.1.0

USER root

WORKDIR /code

ADD pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src/main /code/src/main
RUN ["mvn", "package"]
RUN chmod a+rwx target/cmad-advanced-staging-demo-fat.jar

CMD ["java", "-jar", "target/cmad-advanced-staging-demo-fat.jar" "-cluster"]
