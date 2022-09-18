#!/bin/bash

convertToPng() {
    setTime start
    extension="${full_file_name##*.}"
    
    if [ "${extension}" != "png" ]; then
        log "Convert*.${extension}*to*png"
        convert "${full_file_name}" "${full_file_name%.*}.png"
        rm "${full_file_name}"
        full_file_name=${full_file_name%.*}.png
        setTime stop
        getTime
        check
    fi
    
}