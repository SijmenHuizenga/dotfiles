#!/usr/bin/env bash
rsync --ignore-existing -raz --progress /home/sijmen/.secrets/private/sijmenhuizenga/ssh/ /home/sijmen/.ssh
ln -sfn /home/sijmen/dotfiles/sshconfig /home/sijmen/.ssh/config
ln -sfn /home/sijmen/dotfiles/.gitconfig /home/sijmen/.gitconfig

gpg --import /home/sijmen/.secrets/private/sijmenhuizenga/pgp/sijmenhuizenga.pub
gpg --import /home/sijmen/.secrets/private/sijmenhuizenga/pgp/sijmenhuizenga.asc
