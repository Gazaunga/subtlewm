# enable emacs as systemd service
systemctl enable --user emacs
systemctl start --user emacs

git config --global user.name "Gazaunga"
git config --global user.email "jeremy.ottley@gmail.com"
git config --global core.autocrlf input
git config --global core.safecrlf true

cd ~
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
wget https://raw.githubusercontent.com/Gazaunga/Spacemacs/master/.spacemacs -O .spacemacs
