# 启用补全项分组显示（按类型分类，例如选项/命令/目录）
zstyle ':completion:*' group-name ''
# 允许对命令选项本身进行补全（例如 ls -- 后列出 --all）
zstyle ':completion:*' complete-options true
# 菜单补全：按一次 Tab 显示列表，按两次开始选择
zstyle ':completion:*' menu select=2
# 忽略大小写（小写也能匹配大写）
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# 只有一个补全项时直接补全，不显示菜单
zstyle ':completion:*' completer _complete _match _approximate
# 为不同命令设置补全组顺序（示例：ls 优先补全选项、外部命令、目录）
zstyle ':completion:ls:*' group-order options external-commands directories
# 当唯一匹配时立即插入完整内容（不产生歧义）
zstyle ':completion:*' insert-unambiguous true
# ----- 外观与颜色 -----
# 分组描述的格式：绿色简洁样式
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
# 补全列表的颜色（使用系统 LS_COLORS）
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 选项名称高亮（蓝色）
zstyle ':completion:*:options' list-colors '=^(--*)=01;34'
# ----- 性能与缓存 -----
# 缓存路径（使用前面定义的 ZCOMPCACHE）
zstyle ':completion:*' cache-path "$ZCOMPCACHE"