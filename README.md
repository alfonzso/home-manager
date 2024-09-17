# init nix in target OS

```shell
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

###### .config dir can be in different name like .config-ubuntu20 or something else
move/copy [nix.conf](.config/nix/nix.conf) to your .config/nix directory
