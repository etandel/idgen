#!/usr/bin/bash

moonc tests.moon
if [ $? ]; then
    busted --lpath='./?.lua;./?.moon' tests.lua
    rm tests.lua
fi

