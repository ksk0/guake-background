__gauek_bg_complete(){
	[[ $COMP_CWORD -gt 2 ]] && return

	if [[ $COMP_CWORD -eq 1 ]]; then
		COMPREPLY=($(compgen -W "set help" $2))
		return
	fi

	[[ $3 != set ]] && return

	local color_code=$(guake-background get)

	COMPREPLY=($(compgen -W "vi vim nvim $color_code" $2))
}

complete -F __gauek_bg_complete guake-background
