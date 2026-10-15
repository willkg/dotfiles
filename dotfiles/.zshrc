for fn in $HOME/dotfiles/zsh.d/*; do
  echo "sourcing $fn"
  source "$fn"
done
