#!/bin/bash

# 安装脚本
INSTALL_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
HICOLOR_DIR="$HOME/.local/share/icons/hicolor"
APPS_DIR="$HICOLOR_DIR/scalable/apps"

echo "正在安装 Gemini Toggle Desktop (v2.2 - GTK Icon Cache)..."

# 创建目录
mkdir -p "$INSTALL_DIR"
mkdir -p "$APP_DIR"
mkdir -p "$APPS_DIR"

# 初始图标设置 (默认显示桌面图标)
SRC_DESKTOP="/usr/share/icons/Yaru/scalable/places/user-desktop-symbolic.svg"
if [ -f "$SRC_DESKTOP" ]; then
    cp -f "$SRC_DESKTOP" "$APPS_DIR/show-desktop-current.svg"
    # 初始化缓存
    gtk-update-icon-cache -f -t "$HICOLOR_DIR" &> /dev/null
fi

# 复制脚本并重命名
cp toggle-desktop.sh "$INSTALL_DIR/toggle-desktop.sh"
cp show-desktop.desktop "$APP_DIR/show-desktop.desktop"

# 设置权限
chmod +x "$INSTALL_DIR/toggle-desktop.sh"

# 刷新数据库
update-desktop-database "$APP_DIR" &> /dev/null

echo "安装完成! 现在点击 Dock 栏或菜单中的 'Show Desktop' 图标即可实现双向切换桌面了。"
