script = "guake-background"

bin_dir = /usr/local/bin

shell   != which zsh || echo /bin/bash
is_zsh  != which zsh
is_bash != which bash

bash_complete = complete.bash
zsh_complete  = complete.zsh

bash_complete_dir = /etc/bash_completion.d
zsh_complete_dir != \
	which zsh >/dev/null && \
	zsh -c 'echo $${(M)fpath:\#*Completion/Unix}'

help:
	@echo
	@echo "   syntax: make {install|uninstall}"
	@echo

install:   .check_for_zsh .run_as_root .empty_echo .install_files
	@echo

uninstall: .run_as_root .empty_echo .uninstall_files
	@echo

.run_as_root:
	@if ! [ "$(shell id -u)" = 0 ]; then \
		echo "\e[31m"; \
		echo "You are not root, run this target as root please!"; \
		echo "\e[0m"; \
		exit 1; \
	fi

.check_for_zsh:
	@if [ "${is_zsh}" = "" ]; then \
		echo "\e[31m"; \
		echo "ZSH shell is not installed on this system! Please install it."; \
		echo "\e[0m"; \
		exit 1; \
	fi


.empty_echo:
	@echo

.install_files:
	@echo -n "   Installing files ...................... "
	@[ -z ${root_dir} ] || [ -d ${root_dir}/${bin_dir}           ] || mkdir -p ${root_dir}/${bin_dir}
	@[ -z ${root_dir} ] || [ -d ${root_dir}/${bash_complete_dir} ] || mkdir -p ${root_dir}/${bash_complete_dir}
	@[ -z ${root_dir} ] || [ -d ${root_dir}/${zsh_complete_dir}  ] || mkdir -p ${root_dir}/${zsh_complete_dir}
	@[ -z ${is_bash}  ] || cp src/${bash_complete} ${root_dir}/${bash_complete_dir}/${script}
	@[ -z ${is_zsh}   ] || cp src/${zsh_complete}  ${root_dir}/${zsh_complete_dir}/_${script}
	@cp src/${script} ${root_dir}/${bin_dir}/
	@echo DONE


.uninstall_files:
	@echo -n "   Uninstalling files .................... "
	@[ ! -f ${bin_dir}/${script} ] || rm -f ${bin_dir}/${script}
	@[ ! -f ${zsh_complete_dir}/_${script} ] || rm -f ${zsh_complete_dir}/_${script}
	@[ ! -f ${bash_complete_dir}/${script} ] || rm -f ${bash_complete_dir}/${script}
	@echo DONE
