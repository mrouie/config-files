#### FISH CONFIGURATION FILE

if status is-interactive
    # Fish config
    function fish-configure; vim ~/.config/fish/config.fish; end
    function fish-config; fish-configure; end
    function fish-cfg; fish-configure; end
    function fishrc; fish-configure; end

    # Rust setup
    # . "$HOME/.cargo/env"
    set -Ua fish_user_paths $HOME/.cargo/bin

    # set git default editor to vim
    git config --global core.editor "vim"


    #### ALIASES
    # make less more friendly for non-text input files, see lesspipe(1)
    # [ -x /usr/bin/lesspipe ] && eval "(shell=/bin/sh lesspipe)"

    # ls aliases
    function lla --wraps=ls --description 'List contents of directory using long format, including hidden files, displaying sizes in human-readable format and labeling files and directories with symbols'
        ls -lAFh $argv
    end
    function ll --wraps=ls; ls -lFh $argv; end
    function la --wraps=ls; ls -AFh $argv; end
    function l --wraps ls; ls -Fh $argv; end

    # Cheatsheets
    function vimhelp; eog ~/cheatsheets/vim-cheatsheet*; end
    function tmuxhelp; feh ~/cheatsheets/tmux.png; end
    
    # git aliases 
    function ga --wraps git; git add $argv; end
    function gs --wraps git; git status $argv; end
    function gb --wraps git; git branch $argv; end
    function gc --wraps git; git commit $argv; end
    function gp --wraps git; git push $argv; end
    function gm --wraps git; git merge $argv; end
    function gr --wraps git; git rebase $argv; end

    # Python aliases
    function pudb --wraps pudb3; pudb3 $argv; end
    function venv-create
        python3 -m venv ./.venv
        echo "source ~/.bashrc" >> ./.venv/bin/activate
    end
    function vc; venv-create; end
    function venv-activate; bash --init-file "./.venv/bin/activate"; end
    function va; venv-activate; end

    ### File Management
    function viewimage; echo "feh | eog | [xdg-]open"; end

    # list all unique file types in a directory (recursively)
    function get_all_file_types --description 'Finds and lists all distinct file types in the current directory, recursively'
        find ./$argv -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u
    end
    function listtypes; get_all_file_types $argv; end
    function types; get_all_file_types $argv; end

    # better copy (with a progress bar)
    function cpv --wraps=rsync --description 'Copy with progress bar'; rsync -ah --info=progress2 $argv; end

    ### Other
    function psa --wraps=ps; ps -aux $argv; end
    
    function quit --wraps=exit; exit $argv; end
    function q; exit $argv; end

    function cls --wraps=clear; clear $argv; end
    function clr --wraps=clear; clear $argv; end
    function c; clear $argv; end

    function vimx --wraps nvim --description 'alias vimx=nvim'; nvim $argv; end

    # set fish as default shell
    set -xg SHELL /usr/bin/fish

    # initialize custom starship prompt
    starship init fish | source
end
