#!/bin/bash

pacman -Syu --noconfirm --quiet &&
flatpak update --assumeyes &&
poweroff



