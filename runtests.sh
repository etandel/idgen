#!/usr/bin/bash


if moonc tests.moon; then
    busted -v --lpath='./?.lua;' tests.lua
    rm tests.lua
fi

