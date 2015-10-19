# A image with apache-jmeter-2.12
# For more information; https://github.com/rdpanek/docker_jmeter

# VERSION 2.12

FROM rdpanek/base
MAINTAINER Radim Daniel Pánek <rdpanek@gmail.com>

# env
ENV JMETER_VERSION 2.12
ENV PLUGINS_VERSION 1.2.0
#ENV JMETER_PATH /srv/var/jmeter

ENV JMETER_PATH /usr/share/jmeter



ENV PLUGINS_PATH $JMETER_PATH/plugins


# Automagically accept Oracle's license (for oracle-java8-installer)
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# Install Jmeter
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y  apache2 --force-yes
RUN apt-get install -y wget

#RUN mkdir -p $JMETER_PATH && cd $JMETER_PATH && \
 #   wget  http://www.us.apache.org/dist//jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz && \
  #  tar -zxf apache-jmeter-$JMETER_VERSION.tgz && \
  #  rm apache-jmeter-$JMETER_VERSION.tgz
RUN apt-get install -y jmeter


RUN sed -i 's|session required pam_loginuid.so|session optional pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd
# Install JDK 7 (latest edition)
#RUN apt-get install -y openjdk-7-jdk
# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd






# Install dependencies
# - JMeterPlugins-Standard 1.2.0
# - JMeterPlugins-Extras 1.2.0
# - JMeterPlugins-ExtrasLibs 1.2.0
RUN apt-get install -y unzip
RUN apt-get install -y openssh-server
RUN echo $JMETER_HOME


# Install JMeterPlugins-ExtrasLibs



#RUN mkdir -p $PLUGINS_PATH && \
 #   wget -q http://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-$PLUGINS_VERSION.zip && \
 #   unzip -o -d $PLUGINS_PATH JMeterPlugins-ExtrasLibs-$PLUGINS_VERSION.zip && \
  #  wget -q http://jmeter-plugins.org/downloads/file/JMeterPlugins-Extras-$PLUGINS_VERSION.zip && \
   # unzip -o -d $PLUGINS_PATH JMeterPlugins-Extras-$PLUGINS_VERSION.zip && \
  #  wget -q http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-$PLUGINS_VERSION.zip && \
  #  unzip -o -d $PLUGINS_PATH JMeterPlugins-Standard-$PLUGINS_VERSION.zip

# Copy plugins to jmeter enviroment
#RUN cp $PLUGINS_PATH/lib/*.jar $JMETER_PATH/apache-jmeter-$JMETER_VERSION/lib/
#RUN cp $PLUGINS_PATH/lib/ext/*.jar $JMETER_PATH/apache-jmeter-$JMETER_VERSION/lib/ext/

# Copy user.properties
# ADD user.properties $JMETER_PATH/jmeter/bin/ 
 #RUN cd  $JMETER_PATH/bin 
 #RUN rm -rf $JMETER_PATH/jmeter/bin/user.properties



COPY url-benchmarknew.jmx /
COPY jmeter.properties /
#COPY ./run.sh /usr/bin/run
ADD ./runmaster.sh /usr/bin/runmaster.sh
#ADD ./bin /usr/bin

 RUN chmod +x /usr/bin/runmaster.sh

# CMD bash /usr/bin/runmaster.sh
CMD ["/bin/sh","-e","/usr/bin/runmaster.sh"]

