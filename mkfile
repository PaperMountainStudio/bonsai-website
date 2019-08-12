rsync = rsync -rtvuh4c --progress --delete --exclude '*pastes' --exclude '*uploads'
vps=vps

all: site pkgs releases
    
site:
    ${rsync} --exclude '*pkgs' --exclude '*releases' ${HOME}/src/bonsai-website/ ${vps}:bonsai-website

pkgs:
    ssh ${vps} ${rsync} 'bonsai-pkgs/ bonsai-website/www/pkgs'

releases:
    ssh ${vps} ${rsync} 'bonsai-releases/ bonsai-website/www/releases'

bkup:
    bkupdir=${HOME}/usr/backup/bonsai-website-backup
    rsync -rtvuh4c --delete --progress --exclude "*www/junk" ${vps}:bonsai-website $bkupdir/
