# Gemini Toggle Desktop 双面桌面切换

这是一个简单的 Linux 脚本，通过图形化切换 (Toggle) 的方式，一键显示桌面或恢复原来的窗口布局。

## 更新日志 (v2.2)
- **修复 Bug**：解决了原来“点两次才生效”的问题。现在脚本直接查询窗口管理器状态，状态同步 100% 准确。
- **图标联动**：点击切换后，Dock 栏图标会随之改变，视觉化提示当前桌面状态。
    - **显示应用时**：图标显示“桌面”。
    - **显示桌面时**：图标显示“恢复窗口”。
- **缓存刷新终极方案**：使用 `gtk-update-icon-cache` 技术重建系统图标缓存机制，彻底解决 GNOME 等桌面环境下 Dock 栏图标不实时刷新的顽疾。

## 安装要求
- 系统: Linux (GNOME, KDE, XFCE 等)
- 工具: `wmctrl`, `xprop`, `bash`, `gtk-update-icon-cache`

### 安装依赖 (Ubuntu/Debian)
```bash
sudo apt install wmctrl x11-utils libgtk-3-bin
```

## 安装方法
运行项目中的 `install.sh` 脚本:
```bash
chmod +x install.sh
./install.sh
```

## 使用说明
安装完成后，在应用菜单或 Dock 中找到 **“Show Desktop”** 图标即可使用。
