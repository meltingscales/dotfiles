-- from https://pterodactyl.io/tutorials/mysql_setup.html#creating-a-database-for-pterodactyl
USE mysql;

-- Remember to change 'password' below to be a unique password specific to this account.
CREATE USER 'pterodactyl'@'127.0.0.1' IDENTIFIED WITH mysql_native_password BY 'password';

CREATE DATABASE panel;
GRANT ALL PRIVILEGES ON panel.* TO 'pterodactyl'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;

