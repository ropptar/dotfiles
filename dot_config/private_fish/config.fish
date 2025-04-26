if status is-interactive
    # Hydro Prompt
    set --universal hydro_color_pwd 98971a
    set --universal hydro_color_git 458588
    set --universal hydro_color_prompt ebdbb2
    set --universal hydro_color_error cc241d
    set --universal hydro_color_duratuion 928374

    # Abbreviations
    abbr -a -- gpau git push --all -u
    abbr -a -- wtf tldr
    abbr -a -- chez chezmoi

    # Tools
    pyenv init - fish | source
end

# Created by `pipx` on 2025-04-23 18:55:27
set PATH $PATH /home/ropptar/.local/bin
