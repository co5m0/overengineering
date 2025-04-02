---
title: How to create a NixOS container in Crostini (ChromeOS)
date: 31/03/2025
author:
- co5mo
description: guide - create a NixOS lxc container in Crostini (the ChromeOS linux subsystem)
---
# How to create a NixOS container in Crostini (ChromeOS)

##### March 31, 2025

Linux on ChromeOS, sometimes called Crostini, allows you to run Linux apps for development alongside your usual ChromeOS desktop and apps.

Google has design a very complicated system of chinese boxes[^1], to ensure to run Linux application as isolated as possible from the home OS, but ensure to still have a sort of "seamless" integration between the OSs.

When you activate the "Linux development environment" on ChromeOS, what the system does is creating a VM that runs lxd, with one lxc debian container called "Penguin".

We will do a quick overview on the main services and terminology that we will use in this guide:

- **Crostini** is the umbrella term for making Linux application support easy to use and integrating well with ChromeOS. It largely focuses on getting you a Terminal with a container with easy access to install whatever developer-focused tools you might want. It's the default first-party experience.

- The **Terminal app** is the first entry point to that environment. It takes care of kicking off everything else in the system that you'll interact with.

- **Termina** is a VM image with a stripped-down ChromeOS linux kernel and userland tools. Its only goal is to boot up as quickly as possible and start running containers. Many of the programs/tools are custom here. In hindsight, we might not have named it one letter off from "Terminal", but so it goes.

- **crosh** (ChromeOS shell): A restricted developer shell for running a handful of commands.

- **Garcon** runs inside the container and provides integration with Cicerone/Chrome for more convenient/natural behavior. For example, if the container wants to open a URL, Garcon takes care of plumbing that request back out.

- **Sommelier** is a Wayland proxy compositor that runs inside the container. Sommelier provides seamless forwarding of contents, input events, clipboard data, etc... between Wayland applications inside the container and Chrome.

Every component is open-source, you can find the code [here](https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/vm_tools)

## Enable custom container on Crostini

In order to create a NixOS container we should enable the custom container support in ChromeOS.
(TBF this step is only necessary if you want the same level of integration you have with the default one (eg. easy access from the terminal app, one-click url opener, etc.. ) )

1. Go to *chrome://flags* and enable the *#crostini-multi-container* flag

2. Search for "Linux" in the ChromeOS settings or Settings > About ChromeOS > Linux development enviroment

3. You should now have the "Manage extra containers" options

4. Create a new container with these settings:
 - Image server: [https://images.lxd.canonical.com/](https://images.lxd.canonical.com/)
 - Image alias: `nixos/24.05/amd64` (you can choose from the available versions as *24.05* or *unstable* and archirecute *arm64* or *amd64*)

PUT HERE THE SCREEEN SHOT

Now you should see a new container displayed in the terminal, but clicking on it should open a new terminal tab and then it should crash right away

## Setup the the container

Now we have the NixOS container created on the VM but we can't access it as the default one, to do so we need to modify the nix configuration.o

1. Open `crosh` with `Ctrl+Alt+t`

2. Enter in the *termina* VM with
```bash
vsh termina
```

3. List all the containers available
```bash
lxc list
```
The output should return a table with two entries, one named *penguin* and the other with the name you have assigned to the container in the previous section

4. Login into the container
```bash
lxc exec nixos /bin/bash
```
This command gives you access to the container shell

> If bash is not found thy with `/bin/sh`

5. Add this snippet to `/etc/nixos/configuration.nix` [^2]
```nix
systemd.services.garcon = {
    enable      = true;
    description = "Chromium OS Garcon Bridge";
    after       = [ "sommelier@0.service" "sommelier-x@0.service" ];
    script      = "/opt/google/cros-containers/bin/garcon --server";
    wantedBy    = [ "default.target" ];
};
```

6. Exit from the container and restart it with
```bash
lxc restart nix
```
7. Return in the terminal app and try to launch the nixos container from the homepage

If the container crash try to reboot the entire Linux environment (right click on the terminal app in the dock > shut down Linux)

8. (Bonus) If for some reason the process doens't work with your configuration you can enable ssh in the NixOS container and add the connection to the Terminal app, in this way to can access the container from the homepace anyway. Lxc should alway assign the same ip to the container so you don't have to worry about to find the right ip every time.
To find the ip, run `lxc list`


### Refs:

[^1]: https://www.chromium.org/chromium-os/developer-library/guides/containers/crostini-developer-guide/crostini_services.png
[^2]: https://github.com/tazjin/nixini/blob/master/nixini-config.nix
