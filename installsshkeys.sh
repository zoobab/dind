#!/bin/bash
set -e

SSHCONFIGDIR="common/dotsshconfig"

function checkreturncode() {
if [[ $? -eq 0 ]]; then
        echo -ne "[OK]\n"
fi
}

function copyfile() {
FILE="$1"
echo -ne "Copying $FILE to your $HOME/.ssh/ ..."
cp $SSHCONFIGDIR/$FILE ~/.ssh/ && chmod 600 ~/.ssh/$FILE
checkreturncode
}

copyfile config_zoodind
copyfile id_rsa_zoodind
copyfile id_rsa_zoodind.pub
