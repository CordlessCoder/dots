#!/bin/sh

xdotool search --name '( \- NVIM|^nvim )' windowactivate || kitty nvim
