#!/bin/bash

# 安装脚本
INSTALL_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"

echo "正在安装 Gemini Toggle Desktop (v2.6 - Apple Finder Big Sur Icon)..."

# 创建目录
mkdir -p "$INSTALL_DIR"
mkdir -p "$APP_DIR"
mkdir -p "$ICON_DIR"

# 下载苹果 Finder Big Sur 图标 (如果不存在)
# 链接使用维基百科的高清原图
if [ ! -f "$ICON_DIR/finder.png" ]; then
    echo "正在下载 Finder Big Sur 图标..."
    wget -O "$ICON_DIR/finder.png" https://upload.wikimedia.org/wikipedia/commons/c/c9/Finder_Icon_macOS_Big_Sur.png &> /dev/null
fi

# 复制脚本并重命名
cp toggle-desktop.sh "$INSTALL_DIR/toggle-desktop.sh"
cp show-desktop.desktop "$APP_DIR/show-desktop.desktop"

# 设置权限
chmod +x "$INSTALL_DIR/toggle-desktop.sh"

# 刷新数据库
update-desktop-database "$APP_DIR" &> /dev/null

echo "安装完成! 现已设置为 macOS Big Sur 风格的 Finder 图标，点击 Dock 栏图标即可实现双向精准切换。"
