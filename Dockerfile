FROM centos:latest
RUN yum update -y
RUN yum -y install openssh-server
RUN yum install httpd -y
RUN yum install mysql -y
RUN yum install net-tools -y

#RUN sed -i 's/enforcing/disabled/g' /etc/selinux/config && \
#	setenforce 0
RUN useradd deployer && \
	echo "deployer:1234" | chpasswd && \
	mkdir /home/deployer/.ssh && \
	chmod 700 /home/deployer/.ssh
	
COPY id_rsa.pub /home/deployer/.ssh/authorized_keys

RUN chown deployer:deployer /home/deployer/.ssh -R && \
	chmod 600 /home/deployer/.ssh/authorized_keys

COPY gaadi.conf /etc/httpd/conf.d/gaadi.conf
RUN chmod 600 /etc/httpd/conf.d/gaadi.conf
RUN chown root:root /etc/httpd/conf.d/gaadi.conf

EXPOSE 80
EXPOSE 443

RUN usermod -a -G apache deployer

RUN ssh-keygen -A

RUN mkdir -p /home/deployer/gaadi/current
COPY test/index.html /home/deployer/gaadi/current/
RUN chmod 777 -R /home/deployer/
RUN chown -R deployer:deployer /home/deployer/

#RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf

#RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf

ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]
