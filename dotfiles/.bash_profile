for fn in $(find $HOME/dotfiles/bash.d/ -type f | sort); do
    echo "sourcing $fn"
    source "$fn"
done
