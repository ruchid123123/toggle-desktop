# Gemini Toggle Desktop 双面桌面切换

这是一个简单的 Linux 脚本，通过图形化切换 (Toggle) 的方式，一键显示桌面或恢复原来的窗口布局。

## 设计理念：双子座 (Gemini)
不同于标准的“显示桌面”功能（只能单向隐藏窗口），本项目通过“双面性”的设计逻辑：
- **第一面**：隐藏所有活跃窗口，呈现干净的桌面。
- **第二面**：再次点击，瞬间找回刚才的所有窗口位置。
如同双子座的两个侧面，它在“桌面”与“工作区”之间自由切换。

## 安装要求
- 系统: Linux (GNOME, KDE, XFCE 等)
- 工具: `wmctrl`, `bash`

### 安装依赖 (Ubuntu/Debian)
```bash
sudo apt install wmctrl
```

## 安装方法
运行项目中的 `install.sh` 脚本:
```bash
chmod +x install.sh
./install.sh
```

## 使用说明
安装完成后，在应用菜单或 Dock 中找到 **“Show Desktop”** 图标即可使用。图标采用了具有对称感的镜像设计，体现了其“双面”特有的功能。
