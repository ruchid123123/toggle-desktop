#!/bin/bash

# 安装脚本
INSTALL_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
HICOLOR_DIR="$HOME/.local/share/icons/hicolor"
APPS_DIR="$HICOLOR_DIR/scalable/apps"

echo "正在安装精简版 Gemini Toggle Desktop (v2.4)..."

# 清理旧版本的残留文件
rm -f "$APPS_DIR/show-desktop-current.svg"
rm -f "$APPS_DIR/show-desktop-on.svg"
rm -f "$APPS_DIR/show-desktop-off.svg"
gtk-update-icon-cache -f -t "$HICOLOR_DIR" &> /dev/null

# 创建目录
mkdir -p "$INSTALL_DIR"
mkdir -p "$APP_DIR"

# 复制脚本并重命名
cp toggle-desktop.sh "$INSTALL_DIR/toggle-desktop.sh"
cp show-desktop.desktop "$APP_DIR/show-desktop.desktop"

# 设置权限
chmod +x "$INSTALL_DIR/toggle-desktop.sh"

# 刷新数据库
update-desktop-database "$APP_DIR" &> /dev/null

echo "安装完成! 现已还原为极简模式，点击 Dock 栏图标即可实现 100% 准确的双向切换。"
