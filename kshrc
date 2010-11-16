if [ -d "${HOME}/.commonsh" ] ; then
    for file in "${HOME}"/.commonsh/* ; do
        . "${file}"
    done
fi

if [ -d "${HOME}/.ksh" ] ; then
    for file in "${HOME}"/.ksh/* ; do
        . "${file}"
    done
fi
