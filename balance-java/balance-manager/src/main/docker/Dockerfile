# 基镜像
FROM openjdk:8u232-jre
# 设置时区
ENV TZ=Asia/Shanghai
# ENV LANG C.UTF-8
# 定义匿名卷
VOLUME /tmp
# 中文字体
#ADD classes/SourceHanSerifCN-Regular.ttf /usr/share/fonts/SourceHanSerifCN-Regular.ttf
# 复制文件重命名
ADD balance.jar app.jar
# 暴露端口
EXPOSE 8686
# 入口点
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]