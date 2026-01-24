#!/bin/bash

# ==============================
# 构建脚本 - 获取最新版本文件
# © 2023-2026 LX-Source Project.
# ==============================

# GitHub 用户名和仓库名
OWNER="ZxwyWebSite"
REPO="lx-source-next"

# 直接解析原始页面，绕过 API 速率限制
RELEASE=$(curl -s "https://github.com/$OWNER/$REPO/releases")

# 使用正则表达式提取第一个 TAG
VERSION=$(echo "$RELEASE" | grep -oP '/tree/\K[^"]+' | head -n 1)

if [[ -z "$VERSION" ]]; then
  echo "没有找到符合条件的下载链接。"
  exit 1
fi

# 拼接文件名与下载链接
FILENAME="lxsrcs-$VERSION-linux-amd64v3-gnu.zip"
DOWNLINK="https://github.com/$OWNER/$REPO/releases/download/$VERSION/$FILENAME"

echo "下载链接: $DOWNLINK"

# 下载文件
if ! wget -O "$FILENAME" "$DOWNLINK"; then
  echo "下载失败！"
  exit 1
fi

# 解压文件
if ! unzip "$FILENAME"; then
  echo "解压失败！"
  exit 1
fi

echo "文件下载完毕！"
