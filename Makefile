# Makefile

# Recipe(s)
PKG_NAME = "tmux-controller"
BIN_NAME = "tmuxctrl"
CC =
CXX = 
CFLAGS =

# Rules/Targets
build:
	## Build & Compile source code into binary

install:
	## Install source code/script/binary into system path
	install src/tmuxctrl /usr/local/bin

uninstall:
	## Remove source code/script/binary/files installed into system path
	rm -f "$$(which $(BIN_NAME))"

clean:
	## Clean-up all temporary files generated during building process
