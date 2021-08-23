# ruby settings
set -gx GEM_HOME (ruby -e 'print Gem.user_dir')

# global settings
set -gx EDITOR nano
if test -d (ruby -e 'print Gem.user_dir')/bin
    set -gx PATH (ruby -e 'print Gem.user_dir')/bin $PATH
end
if test -d ~/.local/bin
    set -gx PATH ~/.local/bin $PATH
end
if test -d ~/.dotnet/tools
    set -gx PATH ~/.dotnet/tools $PATH
end
if test -d ~/go/bin
    set -gx PATH ~/go/bin $PATH
end
if test -d ~/.cargo/bin
    set -gx PATH ~/.cargo/bin $PATH
end
