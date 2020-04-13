# 基础镜像
FROM centos:centos7
# 添加维护标签信息
LABEL maintainer shixiaobo8@163.com
# 执行用户
USER root
# 添加环境变量
ENV WEBROOT_DIR=/www/web/
ENV PYTHONIOENCODING=utf-8
ENV WEB_DIR=$WEBROOT_DIR/myresume
# 运行命令
RUN yum install net-tools psmisc supervisor epel-release python36 python36-devel python36-pip -y
# 安装supervisor 并且启动supervsir
RUN yum clean all && yum makecache && yum install  supervisor  -y &&  mkdir -p $WEBROOT_DIR && pip3 install flask && systemctl enable supervisord
# 容器工作目录
WORKDIR $WEB_DIR
#cmd ['echo $WEBROOT_DIR','echo $WEB_DIR']
# 拷贝上下文中的指定文件到容器
#COPY /www/web/my_resume .
#ADD docker/my_resume.tar.gz $WEB_DIR
ADD docker/myresume_start_init.sh /etc/init.d/
ADD docker/my_resume.tar.gz .
CMD ["/etc/init.d/myresume_start_init.sh"]
#CMD ["/usr/sbin/init"]
VOLUME ["$WEBROOT_DIR","$WEBROOT_DIR"]
EXPOSE 8002
