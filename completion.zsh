# ------------------------------------------------------------------------------
# 1. 核心补全控制
# ------------------------------------------------------------------------------

# 配置补全器（Completer）优先级：
# _expand: 展开变量或别名 | _complete: 标准补全 | _ignored: 尝试补全被忽略项 | _approximate: 拼写纠错补全
zstyle ':completion:*' completer _expand _complete _ignored _approximate

# 启用补全项的分组显示（如：选项、命令、别名、目录等）
zstyle ':completion:*' group-name ''

# 强制对命令的长/短选项进行补全（例如：ls --<TAB>）
zstyle ':completion:*' complete-options true

# 菜单选择逻辑：存在 2 个及以上匹配项时启用交互式菜单，并支持在菜单内实时输入过滤
zstyle ':completion:*' menu select=2 interactive

# 插入逻辑：当补全结果无歧义时，直接插入匹配内容而不再弹出菜单
zstyle ':completion:*' insert-unambiguous true

# ------------------------------------------------------------------------------
# 2. 匹配规则与模糊处理
# ------------------------------------------------------------------------------

# 补全匹配策略：
# 1. 大小写不敏感匹配
# 2. 允许对分隔符（. _ -）进行模糊匹配（例如输入 config 匹配 .config）
# 3. 允许子字符串或后缀匹配
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# 补全变量名（如 $PATH）时保持原始前缀，避免被错误截断
zstyle ':completion:*' keep-prefix true

# 在执行目录跳转（cd）补全时，忽略当前目录（.）及父目录（..）以减少干扰
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# ------------------------------------------------------------------------------
# 3. 交互界面与视觉外观
# ------------------------------------------------------------------------------

# 补全列表着色：同步系统 LS_COLORS 配置
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 针对不同状态的描述信息格式化（支持色彩渲染）：
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'              # 标准分类描述
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f' # 拼写纠错提示
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'                     # 状态信息
zstyle ':completion:*:warnings' format ' %F{red}-- No matches found --%f'           # 无匹配项警告

# 针对命令选项（options）的高亮显示（深蓝色）
zstyle ':completion:*:options' list-colors '=(#b)--[a-zA-Z0-9-]#=01;34'

# 针对进程补全（如 kill）的 PID 高亮（红色）
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# ------------------------------------------------------------------------------
# 4. 性能优化与持久化缓存
# ------------------------------------------------------------------------------

# 启用补全缓存功能，显著提升重型命令（如 git, docker）的补全响应速度
zstyle ':completion:*' use-cache yes

# 指定补全缓存文件的存储路径（变量 $ZCOMPCACHE 需提前定义）
zstyle ':completion:*' cache-path "$ZCOMPCACHE"

# 在执行补全时重新哈希（rehash）命令路径，确保新安装的软件能立即被识别
zstyle ':completion:*' rehash true