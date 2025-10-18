#!/bin/bash

killall waybar
hyprctl reload  
hyprctl dispatch exec waybar