# Tweaked juang<something> and funky themes

# Needs Git plugin for current_branch method
# Needs virtualenv plugin for virtualenv_prompt_info method

# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY="─%{$RED%}(*)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED="─${blue_op}%{$RED%}unmerged${blue_cp}"
ZSH_THEME_GIT_PROMPT_DELETED="─${blue_op}%{$RED%}deleted${blue_cp}"
ZSH_THEME_GIT_PROMPT_RENAMED="─${blue_op}%{$YELLOW%}renamed${blue_cp}"
ZSH_THEME_GIT_PROMPT_MODIFIED="─${blue_op}%{$YELLOW%}modified${blue_cp}"
ZSH_THEME_GIT_PROMPT_ADDED="─${blue_op}%{$GREEN%}added${blue_cp}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="─${blue_op}%{$WHITE%}untracked${blue_cp}"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=""

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="─${blue_op}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="${blue_cp}"



# Prompt format
# PROMPT='%{$P_PFIX1%}$(virtualenv_prompt_info) %{$GREEN_BOLD%}$(current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}
# %{$P_PFIX2%}%{$GREEN%}%~%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%} %{$GREEN%}>%{$RESET_COLOR%} '

local path_p="─${blue_op}%~${blue_cp}"
local user_host="─${blue_op}%n@%m${blue_cp}"
local ret_status="─${blue_op}%?${blue_cp}"
local hist_no="${blue_op}%h${blue_cp}"
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
local smiley_p="─${blue_op}${smiley}${blue_cp}"

local venv='$(virtualenv_prompt_info)'
local branch='${blue_op}$(current_branch)${blue_cp}'
local commit='$(git_prompt_short_sha)'
local dirty='$(parse_git_dirty)'

PROMPT="╭${path_p}${ret_status}${venv}${branch}${commit}
╰${smiley_p}${dirty} $ "
local cur_cmd="${blue_op}%_${blue_cp}"
PROMPT2="${cur_cmd}> "
RPROMPT='${hist_no} %{$WHITE_BOLD%}[%*]%{$RESET_COLOR%}'
