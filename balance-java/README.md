# 使用docker部署项目

## maven构建docker镜像

使用docker的profile package

```bash
mvn clean package -Pdocker -DskipTests
```

## 删除maven构建docker镜像

```bash
docker stop balance
docker rm balance
docker rmi monezhao/balance:latest
```

## docker 镜像备份

```bash
docker save amd64/openjdk:8u232-jre > jre8.tar
docker save amd64/redis:5.0.9 > redis.tar
docker save mysql:8.0.18 > mysql.tar
docker save monezhao/balance:latest > balance.tar
```

## docker 镜像还原

```bash
docker load < jre8.tar
docker load < redis.tar
docker load < mysql.tar
docker load < balance.tar
```

## docker 启动容器

```bash
# mysql镜像需要命名为mysql
docker run --restart=always -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=112012  -d mysql:8.0.18 --default-authentication-plugin=mysql_native_password

# redis
docker run --restart=always -d --name redis -p 6379:6379 amd64/redis:5.0.9

# 用--link连接MySQL redis
docker run --restart=always -d --name balance --link=mysql:mysql --link=redis:redis -p 8686:8686 monezhao/balance:latest
```

## 解决docker 容器内访问宿主机“No route to host”的问题

```bash
nmcli connection modify docker0 connection.zone trusted

systemctl stop NetworkManager.service
firewall-cmd --permanent --zone=trusted --change-interface=docker0
systemctl start NetworkManager.service
nmcli connection modify docker0 connection.zone trusted
systemctl restart docker.service
```
