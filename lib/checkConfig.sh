#!/bin/bash

checkConfig() {
    if [[ $convert_background_border == "yes" && $convert_border_gradient == "yes" ]]; then
        if [ "$background_border_color" != "none" ]; then
            logError "error" "Conflict detected on config" "'convert_background_border' and 'convert_border_gradient' enable at the same time" "both variable can be enable if 'convert_background_border' value is none"
            exit 1
        fi
    fi
}