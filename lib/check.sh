check() {
  [[ $? -eq 0 && ${PIPESTATUS[0]} -eq 0 ]] \
  && echo -e " ${COLOR_SUCCESS}${OK}${COLOR_DEFAULT} " \
  || echo -e " ${COLOR_DANGER}${FAIL}${COLOR_DEFAULT} "
}

setTime() {
  [[ ${1} = "start" ]] && start_time=$(date +"%s") || stop_time=$(date +"%s")
}

getTime() {
  printf " ${COLOR_DARK_GRAY}~ %-3s" "$((stop_time-start_time))s"
}