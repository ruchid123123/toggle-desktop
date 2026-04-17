#!/bin/bash

# 安装脚本
INSTALL_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
HICOLOR_DIR="$HOME/.local/share/icons/hicolor"
APPS_DIR="$HICOLOR_DIR/scalable/apps"

echo "正在安装 Gemini Toggle Desktop (v2.3 - Dual Icon Sync)..."

# 创建目录
mkdir -p "$INSTALL_DIR"
mkdir -p "$APP_DIR"
mkdir -p "$APPS_DIR"

# 系统图标源路径 (Ubuntu Yaru 主题)
SRC_DESKTOP="/usr/share/icons/Yaru/scalable/places/user-desktop-symbolic.svg"
SRC_RESTORE="/usr/share/icons/Yaru/scalable/ui/window-restore-symbolic.svg"

# 准备双图标标识
if [ -f "$SRC_DESKTOP" ]; then
    cp -f "$SRC_DESKTOP" "$APPS_DIR/show-desktop-off.svg"
    cp -f "$SRC_RESTORE" "$APPS_DIR/show-desktop-on.svg"
    # 初始化图标缓存
    gtk-update-icon-cache -f -t "$HICOLOR_DIR" &> /dev/null
fi

# 复制脚本
cp toggle-desktop.sh "$INSTALL_DIR/toggle-desktop.sh"
# 初始状态设为 off (即显示桌面)
cp show-desktop.desktop "$APP_DIR/show-desktop.desktop"

# 设置权限
chmod +x "$INSTALL_DIR/toggle-desktop.sh"

# 刷新数据库
update-desktop-database "$APP_DIR" &> /dev/null

echo "安装完成! 现在点击 Dock 栏或菜单中的 'Show Desktop' 图标即可实现双向切换并同步图标了。"
