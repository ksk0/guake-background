#compdef guake-background

local -a reply
local -a args=(/$'[^\0]#\0'/)

local vim_color=$(guake-background get)
local -a set_options
# echo ARGS:${(j:--:)@}
#
_regex_words set-options "set options" \
	'vi:use vi colorscheme backround color for guake' \
	'vim:use vim colorscheme backround color for guake' \
	'nvim:use neovim colorscheme backround color for guake' \
	"${vim_color}:current vim background color" 


	set_options=($reply[@])

local -a guake_background_commands
#
_regex_words guake-background-commands "guake-background commands" \
	'set:set guake guake background color:$set_options' \
	'help:show guake-background help'

	args+=($reply[@])


_regex_arguments _guake_background "${args[@]}"

_guake_background "$@"
