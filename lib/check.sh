#!/bin/bash

check() {
    [[ $? -eq 0 && ${PIPESTATUS[0]} -eq 0 ]] \
    && echo -e " [${COLOR_SUCCESS}${OK}${COLOR_DEFAULT}] " \
    || echo -e " [${COLOR_DANGER}${FAIL}${COLOR_DEFAULT}] "
}

setTime() {
    [[ ${1} = "start" ]] && start_time=$(date +"%s") || stop_time=$(date +"%s")
}

getTime() {
    FINAL_TIME=$((stop_time-start_time))
    if (( ${FINAL_TIME} >= 0 && ${FINAL_TIME} <= 10 )); then
        printf "  ~ ${COLOR_SUCCESS}%-3s${COLOR_DEFAULT}" "${FINAL_TIME}s"
    fi
    
    if (( ${FINAL_TIME} >= 11 && ${FINAL_TIME} <= 20 )); then
        printf "  ~ ${COLOR_WARNING}%-3s${COLOR_DEFAULT}" "${FINAL_TIME}s"
    fi
    
    if (( ${FINAL_TIME} > 20 )); then
        printf "  ~ ${COLOR_DANGER}%-3s${COLOR_DEFAULT}" "${FINAL_TIME}s"
    fi
}
