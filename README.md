# account-manager

管理账户余额, 测试用户 admin/123456

## 前端

```bash

# 安装依赖, 需要Node 16版本

    cd snowy-admin-web

    npm install
    # 或者
    yarn install

# 开发

    npm run dev
    # 或者
    yarn run dev

# 构建

    npm run build
    # 或者
    yarn run build

```

## 后端

```bash

cd _sql

# 执行 db_init.sql， init_tables.sql 初始化数据库

cd ..

mvn clean package

```

打包成功后, 运行

```bash
java -jar account.jar
```