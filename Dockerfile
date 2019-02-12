# Pyspark has java 8 dependency
FROM openjdk:8-jdk

RUN apt-get update && apt-get upgrade -y

RUN apt install maven -y

RUN wget https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp

RUN tar xf /tmp/apache-maven-*.tar.gz -C /opt

RUN ln -s /opt/apache-maven-3.6.0 /opt/maven

RUN echo "export M2_HOME=/opt/maven\nexport MAVEN_HOME=/opt/maven\nexport PATH=\${M2_HOME}/bin:\${PATH}" > /etc/profile.d/maven.sh

RUN chmod +x /etc/profile.d/maven.sh

RUN /bin/bash -c "source /etc/profile.d/maven.sh"

RUN apt install scala -y

RUN git clone https://github.com/mdthecool/TH.git

WORKDIR TH

RUN mvn clean install
