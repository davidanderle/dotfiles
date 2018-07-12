#!/bin/bash
USERNAME=$(anderle)
PACKAGE_LIST="
exuberant-ctags biber bsdmainutils bsdutils btrfs-tools build-essential bzip2
ca-certificates cmake cu curl diffutils dpkg dump findutils gcc-6-base
gcc-arm-none-eabi gdb gdb-arm-none-eabi gdisk gedit git git-man grep gzip less
linux-tools-common neovim parted passwd pastebinit python python3 python3.5
python3.5-minimal python3-apport python3-apt python3-blinker
python3-cffi-backend python3-chardet python3-commandnotfound python3-configobj
python3-cryptography python3-dbus python3-debian python3-dev
python3-distupgrade python3-gdbm python3-gi python3-idna python3-jinja2
python3-jsonpatch python3-json-pointer python3-jwt python3-markupsafe
python3-minimal python3-newt python3-oauthlib python3-pkg-resources
python3-prettytable python3-problem-report python3-pyasn1 python3-pycurl
python3-requests python3-serial python3-six python3-software-properties
python3-systemd python3-update-manager python3-urllib3 python3-yaml
python-apt-common python-dev python-pip screen sed tar texlive-latex-base
texlive-bibtex-extra texlive-math-extra texlive-xetex tmux valgrind wget xclip
zip"

echo "Entering root directory..."
cd ~/
echo "Updating & Upgrading..."
sudo apt update && sudo apt upgrade -y
echo "Installing $INSTALL_LIST..."
sudo apt install $INSTALL_LIST -y

git config --global user.email "anderle.david@gmail.com"
git config --global user.name "davidanderle"
GITHUB_URL="https://github.com"
REPOS_TO_CLONE=(\
"thewtex/tmux-mem-cpu-load.git" \
"davidanderle/dotfiles.git"\
)

for i in ${REPOS_TO_CLONE[@]}; do
	REPO_NAME=$(echo $i | awk -F '/' '{print $2}')
	REPO_NAME=$(echo $REPO_NAME | sed 's/\(.*\)\..*/\1/')
	REPO_DESTINATION="$REPO_DIR/$REPO_NAME"
	echo "Cloning $i into ~/"
	git clone $GITHUB_URL/$i $REPO_DESTINATION
done

echo "Configuring dotfiles... Don't forget to put the .exes to System32!"
mv ~/dotfiles/.git ~/.git
rm -rf dotfiles
git pull
csc ~/paste.cs
csc ~/keyboard_layout.cs

echo "Installing tmux-mem-cpu-load..."
cd tmux-mem-cpu-load
cmake .
make
su -
make install
logout

echo "Sourcing bash and tmux..."
source ~/.bashrc
tmux source-file ~/.tmux.conf

echo "Bash initialisation completed!"
exit 0
