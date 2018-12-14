SETUP_ROOT="$(dirname "$(readlink -f "$0")")"

DOT_DIR="$SETUP_ROOT/../dotfiles"

function link_dotfile() {
	local dotfile=$1
	local target="$HOME/.$dotfile"
	local src="$DOT_DIR/$dotfile"
	if [[ -d "$target" ]] ; then
		rm -rf "$target"
	elif [[ -f "$target" || -L "$target" ]] ; then
		rm "$target"
	fi
	echo "$src->$target"
	ln -s "$src" "$target"
}

link_dotfile 'vim'
link_dotfile 'vimrc'
link_dotfile 'bashrc'
link_dotfile 'bash_aliases'
link_dotfile 'gitconfig'

source "$DOT_DIR/bashrc"
