# 当历史记录满时，优先删除重复的旧条目
setopt HIST_EXPIRE_DUPS_FIRST
# 不记录与上一条相同的命令
setopt HIST_IGNORE_DUPS
# 不记录以空格开头的命令
setopt HIST_IGNORE_SPACE
# 执行历史命令前先展开，允许用户确认或修改
setopt HIST_VERIFY
# 在所有 zsh 会话间实时共享历史记录
setopt SHARE_HISTORY