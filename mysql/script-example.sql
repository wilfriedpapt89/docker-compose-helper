# docker run --name mysqldb -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql

#you can't get connected via bash because sql is self contained and can't be called by root user externally
#you  need to get first get the ip of the container by running the cmd bellow
#$ docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mysqldb

#Let's provide the above IP address in the client's host option, with the default port number and protocol type as TCP:
#$ mysql -h $ip_adress -P 3306 --protocol=tcp -u root -p


# connect to mysql and run as root user
#Create Databases
CREATE DATABASE erp_dev;
CREATE DATABASE erp_prod;

#Create database service accounts
CREATE USER 'erp_dev_user'@'localhost' IDENTIFIED BY 'erp_pass';
CREATE USER 'erp_prod_user'@'localhost' IDENTIFIED BY 'erp_pass';
CREATE USER 'erp_dev_user'@'%' IDENTIFIED BY 'erp_pass';
CREATE USER 'erp_prod_user'@'%' IDENTIFIED BY 'erp_pass';

#Database grants
GRANT SELECT ON erp_dev.* to 'erp_dev_user'@'localhost';
GRANT INSERT ON erp_dev.* to 'erp_dev_user'@'localhost';
GRANT DELETE ON erp_dev.* to 'erp_dev_user'@'localhost';
GRANT UPDATE ON erp_dev.* to 'erp_dev_user'@'localhost';
GRANT SELECT ON erp_prod.* to 'erp_prod_user'@'localhost';
GRANT INSERT ON erp_prod.* to 'erp_prod_user'@'localhost';
GRANT DELETE ON erp_prod.* to 'erp_prod_user'@'localhost';
GRANT UPDATE ON erp_prod.* to 'erp_prod_user'@'localhost';
GRANT SELECT ON erp_dev.* to 'erp_dev_user'@'%';
GRANT INSERT ON erp_dev.* to 'erp_dev_user'@'%';
GRANT DELETE ON erp_dev.* to 'erp_dev_user'@'%';
GRANT UPDATE ON erp_dev.* to 'erp_dev_user'@'%';
GRANT SELECT ON erp_prod.* to 'erp_prod_user'@'%';
GRANT INSERT ON erp_prod.* to 'erp_prod_user'@'%';
GRANT DELETE ON erp_prod.* to 'erp_prod_user'@'%';
GRANT UPDATE ON erp_prod.* to 'erp_prod_user'@'%';