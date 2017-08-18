#!/bin/bash
set -e

function checkreturncode() {
if [[ $? -eq 0 ]]; then
        echo -ne "[OK]\n"
fi
}

echo -ne "Copying ssh config to your $HOME/.ssh/ ..."
cp common/dotsshconfig/config_zoodind ~/.ssh/
checkreturncode

echo -ne "Copying ssh private key to your $HOME/.ssh/ ..."
cp common/dotsshconfig/id_rsa_zoodind ~/.ssh/
checkreturncode

echo -ne "Copying ssh pub key to your $HOME/.ssh/ ..."
cp common/dotsshconfig/id_rsa_zoodind.pub ~/.ssh/
checkreturncode
