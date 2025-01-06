#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load aliases
[[ -f ~/.aliases ]] && . ~/.aliases
# Load local configs
[[ -f ~/.bash_local ]] && . ~/.bash_local

# k8s command line tools
source '/usr/bin/switch.sh'
alias kubectl=kubecolor

# Custom prompt
eval "$(starship init bash)"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=50000000;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
# Make some commands not show up in history
export HISTIGNORE=" *:ls:cd:cd -:pwd:exit:date:* --help:* -h";

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

export PATH=~/bin:~/.local/bin:$PATH

[ "$(tty)" = "/dev/tty1" ] && exec env WLR_DRM_NO_ATOMIC=1 sway -V --debug > ~/.sway-$(date +'%Y-%m-%d_%H-%M-%S').log

export HELM_EXPERIMENTAL_OCI=1

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

