#!/bin/bash

# 安装脚本
INSTALL_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"

echo "正在安装 Gemini Toggle Desktop..."

# 创建目录（如果不存在）
mkdir -p "$INSTALL_DIR"
mkdir -p "$APP_DIR"

# 复制脚本并重命名（确保与桌面文件对应）
cp toggle-desktop.sh "$INSTALL_DIR/toggle-desktop.sh"
cp show-desktop.desktop "$APP_DIR/show-desktop.desktop"

# 设置权限
chmod +x "$INSTALL_DIR/toggle-desktop.sh"

# 检查依赖
if ! command -v wmctrl &> /dev/null; then
    echo "提示: 未检测到 wmctrl，请安装它以确保切换功能正常。"
    echo "例如: sudo apt install wmctrl"
fi

echo "安装完成! 现在点击 Dock 栏或菜单中的 'Show Desktop' 图标即可实现双向切换桌面了。"
