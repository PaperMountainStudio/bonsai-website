rsync = rsync -rtvuh4c --progress --delete --exclude '*pastes' --exclude '*uploads'

all: site pkgs
    

pkgs:
    ssh vps ${rsync} '/root/bonsai-pkgs/ /root/bonsai-website/www/pkgs'

site:
    ${rsync} ${HOME}/src/bonsai-website/ vps:/root/bonsai-website
