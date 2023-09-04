#!/bin/bash
# file: minecraft-input.sh
# date: 2017-12-01
# license: GPLv3 https://www.gnu.org/licenses/gpl-3.0.txt
# author: nanpuyue <nanpuyue@gmail.com> https://blog.nanpuyue.com
#
# 依赖：zenity xdotool xclip
#
# 使用方法：
# 将脚本绑定快捷键，不带参数的用于聊天，带-i参数的用于书写告示牌， 例如：
# 设置快捷键 alt + t 绑定 minecraft-input.sh
# 设置快捷键 alt + i 绑定 minecraft-input.sh -i
# 聊天时先按 t ，再按 alt + t，书写告示牌时按 alt + i，输完后回车或单击“确定”即可上屏。
# 如果出现不能上屏的情况，可自行调整 500 与 200 两个延时

window=$(xdotool search --onlyvisible --class "Minecraft")
text="$(zenity --entry --title 中文输入 --text 中文输入)"
echo -n "$text"|xclip -i -sel clip
case "$1" in
    -i )
        xdotool type --delay 500 --window $window "$text"
    ;;
    * )
        xdotool key --delay 200 --window $window --clearmodifiers ctrl+v
    ;;
esacr
