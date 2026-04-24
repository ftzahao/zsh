# Zsh 配置

自用配置

## ~/.zshenv

```zsh
. "$HOME/.config/zsh/.zshenv"
```

## ~/.config/zsh/.zprofile

```zsh
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
eval "$(mise activate zsh --shims)"
```

## ~/.config/zsh/.zshenv

```zsh
# XDG基本目录规范
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}" # 默认配置目录为 ~/.config
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}" # 默认缓存目录为 ~/.cache
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}" # 默认数据目录为 ~/.local/share
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}" # 默认状态目录为 ~/.local/state
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}" # 默认可执行文件目录为 ~/.local/bin

# 把所有 zsh 配置移到 XDG 配置目录下
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
# 补全缓存目录和转储文件路径
export ZCOMPCACHE="${ZDOTDIR}/.zcompcache"
export ZCOMPDUMP="${ZDOTDIR}/.zcompdump"
# 补全函数目录
export ZSH_COMPLETION_DIR="${XDG_DATA_HOME}/zsh/site-functions"

mkdir -p -- "$ZDOTDIR" "$XDG_STATE_HOME/zsh" "$XDG_CACHE_HOME/zsh" "$ZSH_COMPLETION_DIR" 2>/dev/null

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
```

## ~/.config/zsh/.zshrc

```zsh
. /opt/homebrew/opt/zinit/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# history 配置
zinit snippet 'https://raw.githubusercontent.com/ftzahao/zsh/main/history.zsh'
# path 和 fpath 配置
zinit snippet 'https://raw.githubusercontent.com/ftzahao/zsh/main/path+fpath.zsh'
# 加载补全系统配置
zinit snippet 'https://raw.githubusercontent.com/ftzahao/zsh/main/compinit.zsh'
# 加载插件配置
zinit snippet 'https://raw.githubusercontent.com/ftzahao/zsh/main/plugin.zsh'
# 补全样式配置
zinit snippet 'https://raw.githubusercontent.com/ftzahao/zsh/main/completion.zsh'

## GitHub 访问令牌
export GITHUB_TOKEN="******"
## Cargo Registry 访问令牌
export CARGO_REGISTRY_TOKEN="******"
## Hugging Face 访问令牌 https://router.huggingface.co/v1
export HF_TOKEN="******"

# 开发工具初始化环境
zinit snippet 'https://raw.githubusercontent.com/ftzahao/zsh/main/dev-init.zsh'
# 别名配置
zinit snippet 'https://raw.githubusercontent.com/ftzahao/zsh/main/alias.zsh'
```
