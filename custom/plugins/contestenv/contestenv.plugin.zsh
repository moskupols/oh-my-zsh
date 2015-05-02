
TEMPLATES_DIR=~/Dropbox/coding/templates
    
# TODO: make these smarter: looking in the templates dir
# TODO: make templates smarter: specify their structure in files, don't hardcode in Makefile

TEMPLATES_AVAILABLE="main ftxt finout multi empty"
MODULES_AVAILABLE="header solve intmain ftxt finout multi return0 cursor wtfpl"


function addprob() {
    if (($# <= 1)); then
        echo "Usage: "
        echo "       addprob name template"
        echo "       addprob name module1 module2 ..."
        echo "templates: ${TEMPLATES_AVAILABLE}"
        echo "modules: ${MODULES_AVAILABLE}"
        return 0
    fi

    local PROBLEM

    PROBLEM=$1

    if ! mkdir $PROBLEM ; then
        return 1
    fi

    cd $PROBLEM
    cp $TEMPLATES_DIR/Makefile Makefile

    sed -i "s/PROBLEM =/PROBLEM = $PROBLEM/" Makefile

    if (($# > 2)); then 
        sed -i "s/MODULES =/MODULES = ${@:2}/" Makefile
    elif (($# == 2)); then
        sed -i "s/TEMPLATE =/TEMPLATE = $2/" Makefile
#     else
#         sed -i "s/TEMPLATE =/TEMPLATE = empty/" Makefile
    fi

    mkdir tests
    make source

    return 0
}
