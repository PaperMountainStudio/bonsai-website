rsync = rsync -rtvuh4c --progress --delete --exclude '*pastes' --exclude '*uploads'

site: push
    ssh vps ${rsync} '/root/bonsai-pkgs/ /root/bonsai-website/www/pkgs'

push:
    ${rsync} ${HOME}/src/bonsai-website/ vps:/root/bonsai-website
