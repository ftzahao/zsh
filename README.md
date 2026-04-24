# Zsh 配置

自用配置

## .zshrc

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
