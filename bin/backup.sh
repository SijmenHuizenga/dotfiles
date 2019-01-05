rsync -avhP --delete --exclude '$RECYCLE.BIN' --exclude 'pagefile.sys' --exclude 'System Volume Information' --exclude '.Trash-1000' --exclude 'Games' /media/Archief /run/media/sijmen/Sijmen\ Blue/
rsync -avhP --delete \
   --exclude '$RECYCLE.BIN' \
   --exclude '.Trash-1000' \
   --exclude node_modules/ \
   --exclude vendor/ \
   --exclude build/ \
   --exclude bower_components/ \
 /media/Data /run/media/sijmen/Sijmen\ Blue/
rsync -avhP --delete ~/.ssh /run/media/sijmen/Sijmen\ Blue/
