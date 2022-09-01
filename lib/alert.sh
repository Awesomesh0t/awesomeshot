log() {
  printf "**$(date +${COLOR_DARK_GRAY}%Y-%m-%d*${COLOR_RESET}%H:%M:%S)%-60s" "*${1}${GRAY}*" \
    | sed 's/ /./g' | sed 's/*/ /g'
}

logError() {
    echo -e "  ${COLOR_DANGER}${1}${COLOR_RESET}: ${COLOR_BOLD_WHITE}${2}${COLOR_RESET}"
    echo -e "\n  ${COLOR_DANGER}${FAIL}${COLOR_RESET}  ${3}"
    echo -e "  ${COLOR_DANGER}╰>${COLOR_RESET} ${4}"
}
