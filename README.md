# drupal-apache2-dockerfile

1.Download and go to Folder

2.on Dockerfil Write your MYSQLPASSWORD

3.build your docker image

docker build -t YOUR-NAME/drupal-apache2:tag .

docker run -ti --name YOUR-CONTAINER-NAME YOUR-NAME/drupal-apache2:tag /bin/bash
