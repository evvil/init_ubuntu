add_fish() {
  sudo apt-get update
  sudo apt-get install software-properties-common -y
  sudo apt-add-repository ppa:fish-shell/release-4 -y
  sudo apt update
  sudo apt install fish -y
  chsh -s /usr/bin/fish

  #fish
  #  set -Ux LC_ALL en_US.UTF-8
  #  set -Ux LANGUAGE en_US.UTF-8

  #echo "set -Ux LC_ALL en_US.UTF-8" >> ~/.config/fish/config.fish
  #echo "set -Ux LANGUAGE en_US.UTF-8" >> ~/.config/fish/config.fish
}
add_sysctl() {
  sysctl -w net.ipv6.conf.all.forwarding=1
  sysctl -w net.ipv4.ip_forward=1
  sysctl -w net.ipv4.conf.all.route_localnet=1
}

add_apt() {
  apt update
  apt install git tmux curl aria2 htop vim -y
}
add_caddy() {
  #  curl -L -O 'https://caddyserver.com/api/download?os=linux&arch=amd64&p=github.com%2Fcaddy-dns%2Fcloudflare&idempotency=83531331677944'
  sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
  curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
  curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
  sudo apt update
  sudo apt install caddy -y

  systemctl enable caddy
  systemctl start caddy
  systemctl status caddy

  #  caddy reload -conf=/etc/caddy/Caddyfile
}
