#!/bin/bash

./b2 link=static architecture=x86 address-model=64 --stagedir=./stage --with-iostreams --with-program_options stage
