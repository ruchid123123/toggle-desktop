#!/bin/bash

# 获取当前窗口管理器的状态
# wmctrl -m 可以查看到相关信息，但在大多数环境下，
# 我们可以通过 wmctrl -k (toggle) 的特性来实现切换。
# wmctrl -k on 是显示桌面，wmctrl -k off 是恢复窗口。

# 我们通过一个简单的文件标记来记录状态
STATE_FILE="/tmp/desktop_show_state"

if [ ! -f "$STATE_FILE" ] || [ "$(cat "$STATE_FILE")" == "off" ]; then
    # 当前不是桌面，切换到桌面
    wmctrl -k on
    echo "on" > "$STATE_FILE"
else
    # 当前是桌面，恢复窗口
    wmctrl -k off
    echo "off" > "$STATE_FILE"
fi
