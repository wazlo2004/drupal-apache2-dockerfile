FROM ubuntu:14.04

MAINTAINER wazlo200444@gmail.com

RUN apt-get update
RUN apt-get upgrade -y 

# apache2 php5.6
RUN apt-get install apache2 -y
RUN apt-get install php5 -y 
RUN apt-get install php5-gd -y
RUN apt-get install libapache2-mod-auth-mysql -y
RUN apt-get install php5-mysql -y
RUN apt-get install php5-cli -y

RUN apt-get install nano git  wget -y
RUN a2enmod rewrite

# drush
RUN wget http://files.drush.org/drush.phar
RUN php drush.phar core-status
RUN chmod +x drush.phar
RUN sudo mv drush.phar /usr/local/bin/drush
RUN drush init -y



# apache2設定檔與bash.bashrc啟動檔
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD  bash.bashrc  /etc/bash.bashrc
ADD  1.sh  /


# mysql

 RUN apt-get update \
    && apt-get install -y debconf-utils \
    && echo mysql-server mysql-server/root_password password YOURPASSWORD | debconf-set-selections \
    && echo mysql-server mysql-server/root_password_again password YOURPASSWOED | debconf-set-selections \
    && apt-get install -y mysql-server 
 
EXPOSE 80


##php up 5.6
RUN  apt-get install software-properties-common python-software-properties  -y
RUN  apt-get install software-properties-common
RUN  locale-gen en_US.UTF-8
RUN  export LANG=en_US.UTF-8
RUN  export LANG=C.UTF-8
RUN  add-apt-repository ppa:ondrej/php5-5.6
RUN  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  4F4EA0AAE5267A6C
RUN  apt-get update
RUN  apt-get upgrade -y
RUN  apt-get install php5 -y