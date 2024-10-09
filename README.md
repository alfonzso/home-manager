# init nix in target OS

```shell
# install nix in linux with single user
# apt install xz-utils curl wget vim sudo git adduser
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# needed in .bashrc
. /home/$USER/.nix-profile/etc/profile.d/nix.sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

###### .config dir can be in different name like .config-ubuntu20 or something else
move/copy [nix.conf](.config/nix/nix.conf) to your .config/nix directory
