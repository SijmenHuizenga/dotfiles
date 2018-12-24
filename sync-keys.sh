#/bin/bash
rsync --ignore-existing -raz --progress /home/sijmen/.secrets/private/sijmenhuizenga/ssh/ /home/sijmen/.ssh

gpg --import /home/sijmen/.secrets/private/sijmenhuizenga/pgp/sijmenhuizenga.pub
gpg --import /home/sijmen/.secrets/private/sijmenhuizenga/pgp/sijmenhuizenga.asc
