## 镜像来源
FROM grafana/grafana-enterprise:7.5.11-ubuntu
## 制作者信息
MAINTAINER zheng
VOLUME [ "/var/lib/grafana" ]
## 拷贝插件目录
COPY grafanaplugin.tar /opt
## 拷贝数据文件
COPY --chown=grafana:root grafana.db /opt
## 增加插件签名检察信息
COPY grafana.ini /etc/grafana/
## 映射端口
EXPOSE 3000
COPY run.sh /run.sh
ENTRYPOINT ["bash","/run.sh"]