cd "${HOME}"
sudo apt update && sudo apt upgrade -y && sudo apt autoremove
sudo apt install -y git zsh fonts-powerline
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sed -i 's/ZSH_THEME\=\"robbyrussell\"/ZSH_THEME\=\"powerlevel10k\/powerlevel10k\"/' .zshrc
TERMINAL_CONFIG="/mnt/c/Users/"${USER}"/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json"
if [ -f "${TERMINAL_CONFIG}" ]; then
  sed -i 's/\"fontFace\" \: \"Consolas\"\,/\"fontFace\" \: \"Roboto Mono for Powerline\"\,/' "${TERMINAL_CONFIG}"
else
  echo "Unable to find the Windows terminal configuration file, please change the font manually..."
  exit 1
fi
