#!/usr/bin/env bash

# This file is part of ptsd project which is released under GNU GPL v3.0.
# Copyright (c) 2025- Limbus Traditional Mandarin

# change dir to repo root directory
cd "$(dirname "$0")" && cd ..

DICT_NAME=opencc_dict
dict_bin=$(find ./.venv/lib/python3.12/site-packages/ -name $DICT_NAME)

if [[ $dict_bin == "" ]]; then
    echo "$DICT_NAME not found."
    exit 1
fi

for txt_name in data/opencc/*.txt
do
    ocd2_name=${txt_name//txt/ocd2}
    $dict_bin -i ${txt_name} -f text -o ${ocd2_name} -t ocd2
done

echo "generate dictionary finish."
