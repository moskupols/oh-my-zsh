
# Now we use fortune, and those pithy messages are in `greets' file.
# Don't forget to run `strfile greets` after every change.
_GREET_PATH=$(dirname $(readlink -f $0))/greets

cowgreet-skinned() {
# 	local greetings
# 	greetings=('People like you never die. They just suffer and suffer and suffer and use Prozac and their relatives and Excel.'
# 				'Have you mooed today?'
# 				'Kiss the cows and make them die.'
# 				'This zsh session has Super Cow Powers.'
# 				"It's dangerous to go alone... Fry cow!")
# 	local at=$RANDOM%${#greetings[@]}+1
# 	cowsay -f $1 "${greetings[$at]}"

	fortune 10% $_GREET_PATH 20% men-women zippy goedel | sed 's/fortune/cowgreet/g' | cowsay -f $1
}
cowgreet() {
	cowgreet-skinned default
}
cowgreet-skinned cower

