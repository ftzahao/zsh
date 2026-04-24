typeset -U path
path=(
  $HOME/.local/bin
  $path
)
export PATH
# 自定义补全目录
fpath=($ZSH_COMPLETION_DIR $fpath)