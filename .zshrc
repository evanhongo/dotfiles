export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/evan/.local/bin:$PATH"

# Snap
export PATH="/snap/bin:$PATH"

# Homebrew
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"

# Golang
export PATH="/usr/local/go/bin:/home/evan/go/bin:$PATH"

# Alias
alias c=clear
alias g=git
alias p=python
alias d=docker
alias top=htop
alias ls='exa'
alias lt='exa --tree --level=3'
alias fk=fuck
alias cd=z
alias tn='tmux new -s'
alias ta='tmux a -t'
alias vim=nvim
alias ld=lazydocker
alias show=cmatrix

# Configure thefuck
eval $(thefuck --alias)

# Find directory and cd
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
				  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Configure yazi
yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Search command and execute
h() {
  local cmd
  cmd=$(history 1 | awk '{$1=""; print $0}' | sed 's/^ //' | tac | fzf +m) &&
  eval "$cmd"
}

# Init commitizen 
czi(){
  echo '{
  "commitizen": {
    "name": "cz_github_convention",
    "version": "0.0.0",
    "tag_format": "v$version",
    "github_repo": "superman/super-demo",
    "update_changelog_on_bump": true
  }
}' > cz.json
}

ton(){
  ~/.tmux/plugins/tmux-open-nvim/scripts/ton "$1"
}

weather() {
  curl wttr.in
}

starwar() {
  docker run --rm -it ghcr.io/gabe565/ascii-movie play
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh