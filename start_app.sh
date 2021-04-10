#!/usr/bin/env bash
# 启动 mmcached
#memcached -d -m 2048 -l 127.0.0.1 -p 7788 -u root
uvicorn project.bin.app:app --host 0.0.0.0 --port 80 --workers=2 \
--access-log \
--use-colors
echo "started fastapi server ......"
