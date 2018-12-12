SETUP_ROOT="$(dirname "$(readlink -f "$0")")/.."

function link_dotfile() {
	local dotfile=$1
	local target="$HOME/.$dotfile" 
	local src="$SETUP_ROOT/dotfiles/$dotfile" 
	if [[ -d "$target" ]] ; then
		echo "Removing old $target"
		rm -rf "$target"
	elif [[ -f "$target" || -L "$target" ]] ; then
		echo "Removing old $target"
		rm "$target"
	fi
	echo "Link $src -> $target"
	ln -s "$src" "$target"
}

link_dotfile 'vim'
link_dotfile 'vimrc'
link_dotfile 'bashrc'
link_dotfile 'bash_aliases'

source "$HOME/.bashrc"
