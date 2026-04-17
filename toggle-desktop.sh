#!/bin/bash

# 获取系统真实的桌面显示状态 (0 为显示应用, 1 为显示桌面)
REAL_STATE=$(xprop -root _NET_SHOWING_DESKTOP | awk '{print $3}')

# 系统标准用户图标目录
HICOLOR_DIR="$HOME/.local/share/icons/hicolor"
APPS_DIR="$HICOLOR_DIR/scalable/apps"
ICON_CURRENT="$APPS_DIR/show-desktop-current.svg"

# 系统图标源路径 (Ubuntu Yaru 主题)
SRC_DESKTOP="/usr/share/icons/Yaru/scalable/places/user-desktop-symbolic.svg"
SRC_RESTORE="/usr/share/icons/Yaru/scalable/ui/window-restore-symbolic.svg"

# 确保目录存在
mkdir -p "$APPS_DIR"

if [ "$REAL_STATE" == "0" ]; then
    # 当前正在看应用 -> 切换到显示桌面
    wmctrl -k on
    # 替换系统图标库中的图标为“恢复窗口”
    cp -f "$SRC_RESTORE" "$ICON_CURRENT"
else
    # 当前正在看桌面 -> 恢复显示应用
    wmctrl -k off
    # 替换系统图标库中的图标为“桌面”
    cp -f "$SRC_DESKTOP" "$ICON_CURRENT"
fi

# 最关键一步：强制刷新 GTK 系统图标缓存，通知桌面环境图标已变
gtk-update-icon-cache -f -t "$HICOLOR_DIR" &> /dev/null
