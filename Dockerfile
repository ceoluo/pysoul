FROM hub-dev.rockontrol.com/rk-ai-tools/env-ai-auto-docker:base
MAINTAINER ai@rockontrol.com


# 安装python库
ADD requirements.txt ./
RUN pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple
RUN apt update && apt install -y memcached libmemcached-tools unzip

# 本地python环境
ENV PYTHONPATH /workspace/ai_auto_srv/:$PYTHONPATH


# 东八区问题
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# 80 port
EXPOSE 80

WORKDIR /workspace/ai_auto_srv
ADD . .

# docker启动运行默认命令
# ENTRYPOINT ["/bin/sh", "start_app.sh"] 
CMD ["/bin/sh", "start_app.sh"] 
