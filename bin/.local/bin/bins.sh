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


function update_ls() {
	# go
	export GOPROXY=https://goproxy.io
	go install "golang.org/x/tools/gopls@latest"
	# prorobuf
	# go install github.com/bufbuild/buf-language-server/cmd/bufls@latest
	# lua
	update_luals
	# vim
	npm install -g vim-language-server
	# yaml
	npm i -g yaml-language-server
	npm i -g bash-language-server
	# json
	npm i -g vscode-langservers-extracted
	npm i -g typescript-language-server typescript
}

function update_luals() {
	repo="LuaLS/lua-language-server"
	url="https://api.github.com/repos/$repo/tags"
	versionStr=$(eval "curl -s $url | jq '.[0].name'")
	version=$(echo $versionStr | tr -d '"')

	echo "========================================"
	echo "Installing luals-$version..."

	mkdir -p $LIU_TOOLS/luals
	cd $LIU_TOOLS/luals

	pkg="lua-language-server-$version-linux-x64.tar.gz"
	wget https://github.com/LuaLS/lua-language-server/releases/download/$version/$pkg -q --show-progres
	test $? -eq 1 && echo "fial to download" && return

	tar -zxvf ./$pkg
	ln -svf $(pwd)/bin/lua-language-server $HOME/.local/bin/lua-language-server

	echo "========================================"
}

# function update_fnlfmt() {
# 	FENNELHOME=$LUAHOME/fennel
# 	mkdir -p $FENNELHOME && cd $FENNELHOME
# 	echo "========================================"
# 	echo "Installing fnlfmt..."
# 	git_clone_or_update https://git.sr.ht/~technomancy/fnlfmt
# 	cd fnlfmt && make
# 	ln -svf $(pwd)/fnlfmt $HOME/.local/bin/fnlfmt
# 	echo "========================================"
# }

# function update_fennells() {
# 	FENNELHOME=$LUAHOME/fennel
# 	mkdir -p $FENNELHOME && cd $FENNELHOME
# 	echo "========================================"
# 	echo "Installing fennel-ls..."
# 	mkdir -p $FENNELHOME && cd $FENNELHOME
# 	git_clone_or_update https://git.sr.ht/~xerool/fennel-ls
# 	cd fennel-ls && make
# 	ln -svf $(pwd)/fennel-ls $HOME/.local/bin/fennel-ls
# 	echo "========================================"
# }

function update_bin() {
	export GOPROXY=https://goproxy.io
	go install mvdan.cc/gofumpt@latest
	go install github.com/josharian/impl@latest
	go install github.com/fatih/gomodifytags@latest
	go install github.com/cweill/gotests/...@latest
	go install github.com/go-delve/delve/cmd/dlv@latest
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

	go install github.com/swaggo/swag/cmd/swag@latest
	go install github.com/google/wire/cmd/wire@latest
	go install golang.org/x/tools/cmd/stringer@latest
	go install github.com/golang/mock/mockgen@latest

	go install github.com/jesseduffield/lazygit@latest
	go install github.com/jesseduffield/lazydocker@latest

	# go install golang.org/x/perf/cmd/benchstat@latest
	# go install github.com/aclements/perflock/cmd/perflock@latest

	# go install github.com/bufbuild/buf/cmd/buf@latest
	# go install github.com/bufbuild/buf/cmd/protoc-gen-buf-lint@latest
	# go install google.golang.org/protobuf/cmd/protoc-gen-go
	# go install google.golang.org/grpc/cmd/protoc-gen-go-grpc
	# go install github.com/google/gnostic/cmd/protoc-gen-openapi

	go install mvdan.cc/sh/v3/cmd/shfmt@latest
	go install github.com/mrtazz/checkmake/cmd/checkmake@latest

	go install -tags 'mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

	npm install -g fixjson
	npm install -g @bufbuild/buf

	cargo install bat
	cargo install exa
	cargo install just
	cargo install selene
	cargo install stylua
	cargo install fd-find
	cargo install git-delta
	cargo install zoxide
	cargo install zellij
	# cargo install hurl
	# cargo install tree-sitter-cli
	# cargo install --locked --all-features --git https://github.com/ms-jpq/sad --branch senpai

	update_fzf
}

function update_fzf() {
	echo "========================================"
	echo "Installing fzf..."

	git_clone_or_update https://github.com/junegunn/fzf.git $LIU_TOOLS/fzf
	$LIU_TOOLS/fzf/install

	mkdir -p $HOME/.local/bin
	ln -svf $LIU_TOOLS/fzf/bin/fzf $HOME/.local/bin/fzf

	echo "========================================"
}

function update_wrk() {
	PWD=$(pwd)

	echo "========================================"
	echo "Installing wrk..."

	git_clone_or_update https://github.com/wg/wrk.git $LIU_TOOLS/wrk

	cd $LIU_TOOLS/wrk
	sudo make

	mkdir -p $HOME/.local/bin
	ln -svf $LIU_TOOLS/wrk/wrk $HOME/.local/bin/wrk

	echo "========================================"

	cd $PWD
}

function update_tmux() {
	PWD=$(pwd)

	echo "========================================"
	echo "Installing tmux..."

	mkdir -p $XDG_CONFIG_HOME/tmux/plugins/tpm
	git_clone_or_update https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm

	mkdir $LIU_TOOLS/tmux && cd $LIU_TOOLS/tmux
	wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
	test $? -eq 1 && echo "fial to download tmux" && return

	tar -zxvf ./tmux-3.3a.tar.gz
	cd ./tmux-3.3a
	./configure
	make && sudo make install

	mkdir -p $HOME/.local/bin
	ln -svf $(pwd)/tmux $HOME/.local/bin/tmux
	echo "========================================"

	cd $PWD
}

case $1 in
"lsbin")
	update_ls
	;;
"bin")
	update_bin
	;;
"wrk")
	update_wrk
	;;
*)
	update_bin
	update_ls
	;;
esac
