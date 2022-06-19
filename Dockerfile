FROM maven:3.8.1-openjdk-11

LABEL "Author"="Ieva Marta Veidemane"

RUN mkdir docker
WORKDIR /usr/src/ui-automation/docker
COPY src src
COPY *.xml *.sh ./

RUN mvn dependency:resolve
RUN mvn clean install -DskipTests