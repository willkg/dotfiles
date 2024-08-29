# Added by uv on 2024-08-28
if [ -f "${HOME}/.cargo/bin/uv" ]
then
    eval "$(uv generate-shell-completion bash)"
fi
