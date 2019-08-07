site: mdtohtml push
    ssh vps "cp -rf /root/bonsai-pkgs /root/bonsai-website/www/pkgs"

mdtohtml:
    markdown-to-html.sh src/index.md > www/index.html

push:
    rsync -rtvuh4c --progress --delete ${HOME}/src/bonsai-website/ vps:bonsai-website
