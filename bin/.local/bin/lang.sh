#!/usr/bin/sh
#
#*******************************************
# Author:      lcdse7en                    *
# E-mail:      2353442022@qq.com           *
# Date:        2023-05-01                  *
# Description:                             *
#*******************************************

#! /usr/bin/bash
function update_go() {
	GOHOME=$LIU_ENV/golang
	mkdir -p $GOHOME && cd $GOHOME

	GOVERSION=$1
	if [ -z $GOVERSION ]; then
		# get latest go version
		GOVERSION=$(curl -s 'https://go.dev/dl/?mode=json' | grep '"version"' | sed 1q | awk '{print $2}' | tr -d ',"')
	fi
	# get either amd64 or arm64 (darwin/m1)
	GOARCH=$(if [[ $(uname -m) == "x86_64" ]]; then echo amd64; else echo $(uname -m); fi)

	echo "========================================"
	echo "updating $GOVERSION..."
	wget "https://dl.google.com/go/$GOVERSION.linux-$GOARCH.tar.gz" -q --show-progress
	test $? -eq 1 && echo "fial to download" && return
	tar -zxvf $GOVERSION.linux-$GOARCH.tar.gz && rm $GOVERSION.linux-$GOARCH.tar.gz
	echo "========================================"

	# if [ -d $GOHOME/go ]; then
	# 	OLDVERSION=$(go version | awk '{print $3}')
	# 	if [ ! "$OLDVERSION" = "$GOVERSION" ]; then
	# 		echo "old version: $OLDVERSION"

	# 		# bakeup old version
	# 		rm -rf $GOHOME/$OLDVERSION
	# 		mv $GOHOME/go $GOHOME/$OLDVERSION
	# 	fi
	# fi
}

function update_rust() {
	if [[ -f "$(which rustup)" ]]; then
		rustup update

		rustup component add rust-analyzer rust-src
		ln -svf $(rustup which --toolchain stable rust-analyzer) $CARGO_HOME/bin/rust-analyzer

	else
		curl https://sh.rustup.rs -sSf | sh
	fi
}

function update_nodejs() {
	NODEJSHOME=$LIU_ENV/nodejs
	mkdir -p $NODEJSHOME && cd $NODEJSHOME

	NODEJSVERSION=$1
	if [ -z $NODEJSVERSION ]; then
		NODEJSVERSION=$(curl -s https://api.github.com/repos/nodejs/node/tags | jq '.[0].name')
		NODEJSVERSION=${NODEJSVERSION//\"/}
	fi
	NODEJSARCH=x64

	echo "========================================"
	echo "updating nodejs to $NODEJSVERSION..."

	wget https://nodejs.org/dist/$NODEJSVERSION/node-$NODEJSVERSION-linux-$NODEJSARCH.tar.xz -q --show-progress -P $NODEJSHOME
	test $? -eq 1 && echo "fial to download" && return
	xz -d node-$NODEJSVERSION-linux-$NODEJSARCH.tar.xz
	tar -xvf node-$NODEJSVERSION-linux-$NODEJSARCH.tar && rm node-$NODEJSVERSION-linux-$NODEJSARCH.tar

	mv node-$NODEJSVERSION-linux-$NODEJSARCH node
	echo "========================================"

	# npm
	echo "========================================"
	echo "updating npm..."
	npm install npm@latest -g
	echo "========================================"
}

function update_lua() {
	LUAHOME=$LIU_ENV/lua
	mkdir -p $LUAHOME && cd $LUAHOME

	LUAVERSION=5.4.4

	echo "========================================"
	echo "Installing lua-$LUAVERSION..."

	wget https://www.lua.org/ftp/lua-$LUAVERSION.tar.gz -q --show-progress
	test $? -eq 1 && echo "fial to download lua" && return

	tar -zxvf lua-$LUAVERSION.tar.gz
	mv lua-$LUAVERSION lua
	rm -rf lua-$LUAVERSION.tar.gz

	cd lua
	make all test
	sudo ln -svf $LUAHOME/lua/src/lua $HOME/.local/bin/lua
	sudo ln -svf $LUAHOME/lua/src/luac $HOME/.local/bin/luac
	echo "========================================"

	# luarocks
	mkdir -p $LUAHOME/luarocks && cd $LUAHOME/luarocks
	LUAROCKSVERSION=3.9.1

	echo "========================================"
	echo "Installing luarocks-$LUAROCKSVERSION..."

	wget https://luarocks.org/releases/luarocks-$LUAROCKSVERSION.tar.gz -q --show-progres
	test $? -eq 1 && echo "fial to download" && return

	tar zxpf luarocks-$LUAROCKSVERSION.tar.gz
	cd luarocks-$LUAROCKSVERSION
	./configure --with-lua-include=$LUAHOME/lua/src
	make && sudo make install

	sudo luarocks install luasocket

	echo "========================================"

	FENNELHOME=$LUAHOME/fennel
	mkdir -p $FENNELHOME && cd $FENNELHOME
	# fennel
	echo "========================================"
	echo "Installing fennel..."
	luarocks install --local fennel
	echo "========================================"
}

function update_haskell() {
	TEMPHASKELLHOME=$LIU_ENV/haskell
	mkdir -p $TEMPHASKELLHOME && cd $TEMPHASKELLHOME
	mkdir -p $TEMPHASKELLHOME/bin

	echo "========================================"
	echo "Installing ghcup..."
	wget https://downloads.haskell.org/~ghcup/x86_64-linux-ghcup -P $TEMPHASKELLHOME/bin
	test $? -eq 1 && echo "fial to download" && return
	mv $TEMPHASKELLHOME/bin/x86_64-linux-ghcup $TEMPHASKELLHOME/bin/ghcup
	chmod +x $TEMPHASKELLHOME/bin/ghcup

	sudo ln -svf $TEMPHASKELLHOME/bin/ghcup $HOME/.local/bin/ghcup

	ghcup install ghc
	ghcup install stack
	ghcup install cabal
	echo "========================================"
}

case $1 in
"go")
	update_go
	;;
"lua")
	update_lua
	;;
"rust")
	update_rust
	;;
"nodejs")
	update_nodejs
	;;
"haskell")
	update_haskell
	;;
*)
	echo "select one language"
	;;
esac
