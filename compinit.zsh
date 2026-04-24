# 补全缓存目录和转储文件路径
export ZCOMPCACHE="${ZDOTDIR}/.zcompcache"
export ZCOMPDUMP="${ZDOTDIR}/.zcompdump"

# autoload -Uz compinit; compinit
# 加载补全系统（使用 -d 明确指定 dumpfile，避免默认路径混乱）
autoload -Uz compinit
# 如果 dumpfile 存在且创建时间在 24 小时之内，则使用 -C 加速
if [[ -f "$ZCOMPDUMP" && -n "$ZCOMPDUMP"(#qN.mh+24) ]]; then
    compinit -C -d "$ZCOMPDUMP"
else
    compinit -d "$ZCOMPDUMP"
fi

# 启用 Bash 补全兼容（让很多 Bash 工具的补全能直接用）
autoload -Uz bashcompinit && bashcompinit