# eamcsdots
## Install emacs
```bash
scoop install emacs
```
## Specify the configure location
Copy/link the .emacs to the directory: "C:\Users\xxx\AppData\Roaming"
``` bash
# For a link in windows:
cd C:\Users\xxx\AppData\Roaming
mklink .emacs Path_to:.emacs
```
## Manual install emac-application framework
``` bash
# download eaf, just replace "D:/Gitlocal" to your config path
git clone --depth=1 -b master https://github.com/emacs-eaf/emacs-application-framework.git D:/Gitlocal/.emacs.d/site-lisp/emacs-application-framework/
# Install/Update EAF applications and dependencies
cd emacs-application-framework
python install-eaf.py
```
## NPM
nodes was wrapped in "~/.emacs.d/site-lisp/win_software/nodejs"
```bash
# run `npm --version` in emacs shell to verify the npm working well
# if used lsp-bridge for python
npm install -g pyright
```
