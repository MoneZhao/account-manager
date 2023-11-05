# account-manager

管理账户余额, 测试用户 admin/123456

## 前端

```bash

# 安装依赖, 需要Node 16版本

    cd balance-vue

    npm install
    # 或者
    yarn install

# 开发

    npm run dev
    # 或者
    yarn run dev

# 构建

    npm run build:prod
    # 或者
    yarn run build:prod

```

## 后端

```bash

cd balance-java/db/mysql

# 执行 db_init.sql， init_tables.sql 初始化数据库

cd ../..

mvn clean package

```

打包成功后，将war放到tomcat的webapp目录下，启动tomcat。
