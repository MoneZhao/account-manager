DROP DATABASE IF EXISTS account_manager;
CREATE DATABASE account_manager
    DEFAULT CHARSET utf8mb4
    COLLATE utf8mb4_general_ci;

# 测试
# CREATE USER 'test'@'%' IDENTIFIED WITH mysql_native_password BY 'test';
# GRANT ALL PRIVILEGES ON `account_manager`.* TO 'test'@'%' WITH GRANT OPTION;

#生产
# CREATE USER 'monezhao'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
# GRANT ALL PRIVILEGES ON `account_manager`.* TO 'monezhao'@'%' WITH GRANT OPTION;

# 刷新权限
# FLUSH PRIVILEGES;

# 新建数据库时执行
# ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

# 数据库时区差8小时需执行
# show variables like '%time_zone%';
# set time_zone = '+8:00';