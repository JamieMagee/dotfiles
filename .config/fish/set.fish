# bobthefish settings
set -g theme_display_cmd_duration no
set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal
set -g theme_display_date no
set -g theme_display_k8s_context yes

# lastpass settings
set -gx LPASS_AGENT_TIMEOUT 0

# pipenv settings
set -gx PIPENV_SHELL_FANCY 1

# ruby settings
set -gx GEM_HOME (ruby -e 'print Gem.user_dir')

# maven settings
set -gx MAVEN_OPTS "-Xmx1024M -Xss128M -XX:MetaspaceSize=512M -XX:MaxMetaspaceSize=1024M -XX:+CMSClassUnloadingEnabled"

# pdsh settings
set -gx PDSH_SSH_ARGS_APPEND "-q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PreferredAuthentications=publickey"

# global settings
set -gx EDITOR nano
if test -d (ruby -e 'print Gem.user_dir')/bin
    set -gx PATH (ruby -e 'print Gem.user_dir')/bin $PATH
end
if test -d ~/.local/bin
    set -gx PATH ~/.local/bin $PATH
end
