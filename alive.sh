#!/bin/bash

# ==============================
# 保活脚本 - 自动访问接口
# © 2023-2026 LX-Source Project.
# ==============================

# 要访问的接口地址
URL="https://${DOMAIN:-lxsrcs.onrender.com}/api/v0/"
echo "保活地址：$URL"

# 设置间隔时间（秒）
INTERVAL=600 # 10m

while true; do
  # 静默模式发送请求
  if ! curl -s -o /dev/null "$URL"; then
    echo "访问接口时出错: $URL"
  fi
  # 等待指定的间隔时间
  sleep "$INTERVAL"
done
