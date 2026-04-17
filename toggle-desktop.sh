#!/bin/bash

# 获取系统真实的桌面显示状态 (0 为显示应用, 1 为显示桌面)
REAL_STATE=$(xprop -root _NET_SHOWING_DESKTOP | awk '{print $3}')
DESKTOP_FILE="$HOME/.local/share/applications/show-desktop.desktop"

if [ "$REAL_STATE" == "0" ]; then
    # 当前正在看应用 -> 切换到显示桌面
    wmctrl -k on
    # 修改 .desktop 文件中的图标标识为 on (对应恢复窗口)
    if [ -f "$DESKTOP_FILE" ]; then
        sed -i 's/Icon=show-desktop-off/Icon=show-desktop-on/' "$DESKTOP_FILE"
        # 强制更新文件时间戳，让 GNOME Shell 监听到变化并重绘图标
        touch "$DESKTOP_FILE"
    fi
else
    # 当前正在看桌面 -> 恢复显示应用
    wmctrl -k off
    # 修改 .desktop 文件中的图标标识为 off (对应显示桌面)
    if [ -f "$DESKTOP_FILE" ]; then
        sed -i 's/Icon=show-desktop-on/Icon=show-desktop-off/' "$DESKTOP_FILE"
        # 强制更新文件时间戳，让 GNOME Shell 监听到变化并重绘图标
        touch "$DESKTOP_FILE"
    fi
fi
