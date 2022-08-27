#!/bin/bash

set -eux

CITY=ShenZhen.png # 城市名字 + .png是生成图片,不带就只有terminal stdout log
LANGUAGE="zh-CN" # 返回信息的语种


if [ ! -d "assets" ]; then
  mkdir assets
  chmod 755 assets
fi

curl -fGsS -H "Accept-Language: ${LANGUAGE}" --compressed "wttr.in/${CITY}?m\&F\&p\&M\&A\&u\&M\&m" -o assets/$CITY

cur_dateTime="`date +%Y-%m-%d,%H:%m:%s`"  
# 增加执行时间,并输出到文件,避免生成图片没有任何变更,导致Action执行异常
# 不追加,防止文件变得异常庞大
echo "Script execution date: ${cur_dateTime}"  > weather-shell.log

