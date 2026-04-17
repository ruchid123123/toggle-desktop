# Gemini Toggle Desktop 双面桌面切换

这是一个简单的 Linux 脚本，通过图形化切换 (Toggle) 的方式，一键显示桌面或恢复原来的窗口布局。

## 设计理念：极简、稳定
本项目旨在解决 GNOME 环境下“显示桌面”功能不直观、不准确的问题。

## 更新日志 (v2.4)
- **修复 Bug**：解决了原来“点两次才生效”的问题。现在脚本直接查询窗口管理器状态，状态同步 100% 准确。
- **功能极简**：移除了实验性的图标联动功能，回归纯净的单图标切换，提高稳定性。

## 安装要求
- 系统: Linux (GNOME, KDE, XFCE 等)
- 工具: `wmctrl`, `xprop`, `bash`

### 安装依赖 (Ubuntu/Debian)
```bash
sudo apt install wmctrl x11-utils
```

## 安装方法
运行项目中的 `install.sh` 脚本:
```bash
chmod +x install.sh
./install.sh
```

## 使用说明
安装完成后，在应用菜单或 Dock 中找到 **“Show Desktop”** 图标即可使用。
