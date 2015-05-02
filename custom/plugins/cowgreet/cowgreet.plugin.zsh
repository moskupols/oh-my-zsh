
# Now we use fortune, and those pithy messages are in `greets' file.
# Don't forget to run `strfile greets` after every change.
_GREET_PATH=$(dirname $(readlink -f $0))/greets
_COW_PATH=$(dirname $(readlink -f $0))/cows
_COW_SKIN_PATH=$(dirname $(readlink -f $0))/skins

if command -v fortune >/dev/null 2>&1 && command -v sed >/dev/null 2>&1 &&
    command -v cowsay >/dev/null 2>&1 && command -v lolcat >/dev/null 2>&1; then

    cowgreet-skinned() {
        fortune 10% $_GREET_PATH 20% men-women zippy goedel \
        | sed 's/fortune/cowgreet/g' \
        | cowsay $@ \
        | lolcat
    };
    cowgreet() {
        cowgreet-skinned -f `fortune $_COW_PATH` `fortune $_COW_SKIN_PATH`
    }
else
    cowgreet-skinned() {
        echo "please install fortune, additional fortune packs, sed, cowsay and lolcat ._."
    };
    cowgreet() {
        cowgreet-skinned
    }
fi

cowgreet

