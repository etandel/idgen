#!/usr/bin/bash


if moonc spec; then
    busted -v --lpath="$(pwd)/?.lua;" spec
    find ./spec -iname '*.lua' -delete
fi

