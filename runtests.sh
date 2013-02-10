#!/usr/bin/bash


if moonc tests; then
    busted -v --lpath="$(pwd)/?.lua;" tests
    find ./tests -iname '*.lua' -delete
fi

