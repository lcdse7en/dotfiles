#!/usr/bin/sh
#
#*******************************************
# Author:      lcdse7en                    *
# E-mail:      2353442022@qq.com           *
# Date:        2023-05-01                  *
# Description:                             *
#*******************************************

#! /usr/bin/bash
function git_clone_or_update() {
	git clone "$1" "$2" 2>/dev/null && echo 'Update status: Success' || (
		cd "$2"
		git pull
	)
}

function update_zshplugins() {
	mkdir -p $HOME/.zsh-plugins
	git_clone_or_update https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh-plugins/zsh-autosuggestions
	git_clone_or_update https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh-plugins/zsh-syntax-highlighting
	git_clone_or_update https://github.com/zsh-users/zsh-completions.git $HOME/.zsh-plugins/zsh-completions

	git_clone_or_update https://github.com/agkozak/zsh-z $HOME/.zsh-plugins/zsh-z
	git_clone_or_update https://github.com/jocelynmallon/zshmarks $HOME/.zsh-plugins/zshmarks
	git_clone_or_update https://github.com/jeffreytse/zsh-vi-mode $HOME/.zsh-plugins/zsh-vi-mode

}

update_zshplugins
