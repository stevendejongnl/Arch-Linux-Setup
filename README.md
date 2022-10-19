# Arch linux setup

Just a repo for easily setup a basic arch environment.

This script works best with a clean arch installation.

[Simply setup Arch](https://github.com/stevendejongnl/arch-linux-setup/wiki/Simply-setup-arch)


# GPU screen tearing issues (AMD)
First of all you need to install the amd drivers.
After that you can create a configuration file: `/etc/X11/xorg.conf.d/20-amdgpu.conf`
And insert the AMD drivers with a option for tear free.
```
Section "Device"
     Identifier "AMD"
     Driver "amdgpu"
     Option "TearFree" "true"
EndSection
```
