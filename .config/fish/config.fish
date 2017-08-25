# Personal fish config
set -U fish_key_bindings fish_vi_key_bindings
set -U fish_prompt_pwd_dir_length 0

function fish_vi_cursor; end

set -x PYTHONSTARTUP $HOME/.pythonrc
set -x GOPATH $HOME/go

set ESPRESSIF_HOME /opt/Espressif
set ESP_SDK_HOME $ESPRESSIF_HOME/esp-rtos-sdk

set -x SSH_USER xleo

set PATH $PATH /sbin $GOPATH/bin $ESPRESSIF_HOME/crosstool-NG/builds/xtensa-lx106-elf/bin
