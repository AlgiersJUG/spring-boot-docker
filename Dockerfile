#
# Oracle Java 8 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java8
#

# Pull base image.
FROM dockerfile/ubuntu
MAINTAINER Abderrazak BOUADMA <bouadma.abderrazak@gmail.com>

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Install Tools
RUN \
  apt-get install -y wget

# Install Git
RUN \
  apt-get install -y git

# Install Maven
RUN \
  wget http://apache.websitebeheerjd.nl/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz && \
  tar xvf apache-maven-3.2.5-bin.tar.gz


RUN \
	git --version && \
	apache-maven-3.2.5/bin/mvn -version && \
  git clone https://github.com/AlgiersJUG/spring-boot-docker.git && \
  cd spring-boot-docker/ && \
  ~/apache-maven-3.2.5/bin/mvn clean install	


# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]


  