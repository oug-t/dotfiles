export FZF_DEFAULT_OPTS="
  --color=fg:#e5e9f0,bg:-1,hl:#81a1c1
  --color=fg+:#eceff4,bg+:#3b4252,hl+:#81a1c1
  --color=info:#eacb8a,prompt:#bf616a,pointer:#b48ead
  --color=marker:#a3be8c,spinner:#b48ead,header:#5e81ac
  --height 40% 
  --layout=reverse 
  --border 
  --info=inline
  --preview-window='right:60%:wrap'
"

# Use ripgrep (rg)
if command -v rg >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# CTRL-T preview with bat
if command -v bat >/dev/null 2>&1; then
    export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
fi
