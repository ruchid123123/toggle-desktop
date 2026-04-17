#!/bin/bash

# 获取系统真实的桌面显示状态 (0 为显示应用, 1 为显示桌面)
REAL_STATE=$(xprop -root _NET_SHOWING_DESKTOP | awk '{print $3}')

if [ "$REAL_STATE" == "0" ]; then
    # 当前正在看应用 -> 切换到显示桌面
    wmctrl -k on
else
    # 当前正在看桌面 -> 恢复显示应用
    wmctrl -k off
fi
