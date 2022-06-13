# VIM

## Install modified version

```sh
git clone --depth=1 https://github.com/yfzm/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Install EditorConfig

```sh
git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim_runtime/my_plugins/editorconfig-vim
```

Example file for Linux kernel: `.editorconfig`

```text
[*]
indent_style = tab
indent_size = 8
tab_width = 8
trim_trailing_whitespace = true
```

## Install original version with SmoothScroll

```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cp ~/.vimrc ~/.vimrc_bk_$(date -u +"%Y-%m-%dT%H-%M-%S%Z")
cat >> ~/.vimrc <<EOF
function SmoothScroll(up)
    if a:up
        let scrollaction="\<C-Y>"
    else
        let scrollaction="\<C-E>"
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 10m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i
EOF
```
