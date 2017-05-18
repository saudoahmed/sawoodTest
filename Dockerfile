FROM centos:7

MAINTAINER  SAWOOD AHMED

#Install Packages

#SSH SERVER
RUN yum install -y passwd openssh openssh-server openssh-clients sudo

#httpd
RUN yum -y install httpd
RUN usermod -u 1000 apache && groupmod -g 1000 apache

#MYSQL
RUN curl -O http://repo.mysql.com/RPM-GPG-KEY-mysql && rpm --import RPM-GPG-KEY-mysql && rm -f RPM-GPG-KEY-mysql
RUN yum -y localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm && yum -y install mysql-community-client

#REPOS & PHP
RUN curl -O http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 && rpm --import RPM-GPG-KEY-EPEL-7 && rm -f RPM-GPG-KEY-EPEL-7
RUN yum -y install epel-release

RUN curl -O http://rpms.remirepo.net/RPM-GPG-KEY-remi && rpm --import RPM-GPG-KEY-remi && rm -f RPM-GPG-KEY-remi
RUN curl -O http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && rpm -Uvh remi-release-7.rpm && rm -f remi-release-7.rpm

RUN yum --enablerepo=epel,remi,remi-php71 -y install php php-cli php-common php-devel php-gd php-json php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-pear php-pecl-apcu php-pecl-imagick php-pecl-redis php-pecl-uuid php-pecl-xdebug php-pecl-yaml php-pecl-zip

#SUPERVISOR
RUN yum install -y supervisor

RUN yum clean all

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -A -t dsa -f /etc/ssh/ssh_host_dsa_key

#Create user
RUN useradd docker
RUN passwd -f -u docker

#Set up SSH
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
#password=12345678
ADD ./loginkey.pub /home/docker/.ssh/authorized_keys
RUN chown docker /home/docker/.ssh/authorized_keys
RUN chmod 700 /home/docker/.ssh/authorized_keys

#setup sudoers
RUN echo "docker    ALL=(ALL)       ALL" >> /etc/sudoers.d/docker

## Set up SSHD config
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

#update httpd.conf
COPY ./docker.conf /etc/httpd/conf.d/


# supervisord init
RUN echo '' >> /etc/supervisord.conf && \
    echo '[program:httpd]' >> /etc/supervisord.conf && \
    echo 'command=/usr/sbin/httpd -D FOREGROUND' >> /etc/supervisord.conf && \
    echo '' >> /etc/supervisord.conf && \
    echo '[program:sshd]' >> /etc/supervisord.conf && \
    echo 'command=/usr/sbin/sshd -D' >> /etc/supervisord.conf && \
    echo '' >> /etc/supervisord.conf && \
    echo '[program:mysqld]' >> /etc/supervisord.conf && \
    echo 'command=/usr/bin/mysqld_safe' >> /etc/supervisord.conf && \
    echo '' >> /etc/supervisord.conf


# port
EXPOSE 22 80 3306

# run
CMD ["/usr/bin/supervisord", "-n"]
