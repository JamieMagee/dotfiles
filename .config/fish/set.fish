# bobthefish settings
set -g theme_display_cmd_duration no
set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal
set -g theme_display_date no
set -g theme_display_k8s_context yes

# pipenv settings
set -gx PIPENV_SHELL_FANCY 1

# ruby settings
set -gx GEM_HOME (ruby -e 'print Gem.user_dir')

# global settings
set -gx EDITOR nano
set -gx PATH (ruby -e 'print Gem.user_dir')/bin $PATH
