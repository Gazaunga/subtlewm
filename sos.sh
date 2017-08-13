pacaur -Syu --noconfirm xorg-xinit xorg-server emacs adobe-source-code-pro-fonts subtle-git rxvt-unicode rofi \
  adobe-source-sans-pro-fonts \
  adobe-source-serif-pro-fonts \
  otf-texgyre \
  ttf-chromeos-fonts \
  ttf-clear-sans \
  ttf-liberation \
  ttf-linux-libertine \
  ttf-noto \
  ttf-roboto \
  font-bh-ttf \
  ttf-hack \
  ttf-iosevka \
  ttf-font-awesome \
  adobe-source-han-sans-fonts \
  ttf-mac-fonts \
  ttf-symbola \
  ttf-google-fonts-git

git config --global user.name "Gazaunga"
git config --global user.email "jeremy.ottley@gmail.com"
git config --global core.autocrlf input
git config --global core.safecrlf true

cd ~
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
wget https://raw.githubusercontent.com/Gazaunga/Spacemacs/master/.spacemacs -O .spacemacs

sur install Clock-0.33
sur install Cpu-0.3
sur install Volume-0.4
sur install Mpd-0.49
sur install Battery-0.9
sur install Wifi-0.7
sur install Notify-0.44
sur install cpuchart=0.3
sur install Spotify-0.1
sur install AMixer-0.2
sur install ACPI-0.2
