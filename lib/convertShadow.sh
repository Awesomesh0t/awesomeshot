#!/bin/bash

convertShadow() {
    setTime start
    log "Add*shadow*image"
    
    convert "${full_file_name}" \
    \( \
    +clone \
    -background "${shadow_color}" \
    -shadow "${shadow_size}" \
    \) \
    +swap \
    -background none \
    -layers merge \
    +repage "${full_file_name}"
    
    setTime stop
    getTime
    check
}