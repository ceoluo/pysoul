#!/usr/bin/env bash

kill `ps -ef|grep uvicorn | awk '{print $2}'`
echo "killed fastapi server ......"