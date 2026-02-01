#!/bin/bash

pacman -Syu --noconfirm --quiet --ignore glibc --ignore lib32-glibc &&
flatpak update --assumeyes &&
poweroff
