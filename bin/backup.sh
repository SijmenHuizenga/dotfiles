set -e

target=/media/sdc1

rsync -avhP --delete \
  --exclude '$RECYCLE.BIN' \
  --exclude 'pagefile.sys' \
  --exclude 'System Volume Information' \
  --exclude '.Trash-1000' \
  --exclude 'Games' \
 /media/archief/ $target/Archief

rsync -avhP --delete \
   --exclude node_modules/ \
   --exclude vendor/ \
   --exclude build/ \
   --exclude bower_components/ \
 ~/projects/ $target/Data/projects

rsync -avhP --delete ~/.ssh/ $target/.ssh

rsync -avhP --delete ~/audio/ $target/Data/audio

rsync -avhP --delete ~/documents/ $target/Data/documents
