#!/bin/bash
echo "go build ..."
sh ./version.sh
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build && \
mkdir tmp && \
# cp -a $GAMEDATA/config/json  tmp/
cp -a views tmp/views && \
cp -a conf tmp/conf && \
cp -a static tmp/static && \
cp -a .cert tmp/.cert && \
cp Dockerfile tmp/ && \
cp goblog tmp/ && \
cp version tmp/ && \
cd tmp && \

# docker -H tcp://127.0.0.1:2375 build -t gameserver .
docker build -t registry.deepzz.com:5000/goblog . 
cd .. 
rm -rf tmp
