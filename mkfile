rsync = rsync -rtvuh4c --progress --delete --exclude '*pastes' --exclude '*uploads'

site: mdtohtml push
    ssh vps ${rsync} '/root/bonsai-pkgs/ /root/bonsai-website/www/pkgs'

mdtohtml:
    markdown-to-html.sh src/index.md > www/index.html

push:
    ${rsync} ${HOME}/src/bonsai-website/ vps:/root/bonsai-website
