FROM ubuntu:14.04

MAINTAINER wazlo2004 

RUN apt-get update
RUN apt-get upgrade -y 

# apache2 php5
RUN apt-get install apache2 -y
RUN apt-get install php5 -y 
RUN apt-get install php5-gd -y
RUN apt-get install libapache2-mod-auth-mysql -y
RUN apt-get install php5-mysql -y
RUN apt-get install php5-cli -y

RUN apt-get install nano git -y
RUN a2enmod rewrite

# drush
RUN wget http://files.drush.org/drush.phar
RUN php drush.phar core-status
RUN chmod +x drush.phar
RUN sudo mv drush.phar /usr/local/bin/drush
RUN drush init



# apache2設定檔與bash.bashrc啟動檔
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD  bash.bashrc  /etc/bash.bashrc


# mysql

 RUN apt-get update \
    && apt-get install -y debconf-utils \
    && echo mysql-server mysql-server/root_password password YOURPASSWORD | debconf-set-selections \
    && echo mysql-server mysql-server/root_password_again password YOURPASSWOED | debconf-set-selections \
    && apt-get install -y mysql-server 
 
EXPOSE 80



