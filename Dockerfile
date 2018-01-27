#Version: 1.0.1

FROM ubuntu:latest

MAINTAINER xxh "xxh@qq.com"

#setting user root as the owner of later cmd.
USER root

# execute operations.
RUN apt-get update
RUN apt-get install -y nginx

#use && combine the cod.
RUN touch test.txt && echo "abc" >> abc.txt

# expose ports.
EXPOSE 80 8080 1038

#add file
ADD abc.txt /opt/

#add folder
ADD /webapp /opt/webapp

#add network file
ADD https://www.baidu.com/img/bd_logo1.png /opt/

#setting environment variable
ENV WEBAPP_PORT=9090

#setting workdir
WORKDIR /opt/

#setting boot cmd
ENTRYPOINT ["ls"]

#setting boot parameters
CMD ["-a","-l"]

#setting volume
VOLUME ["/data", "/var/www"]

#seting condition of chlid images' trigger.
ONBUILD ADD ./app/src
ONBUILD RUN echo "on build excuted" >> onbuild.txt
