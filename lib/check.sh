check() {
  [[ $? -eq 0 && ${PIPESTATUS[0]} -eq 0 ]] \
  && echo -e " ${COLOR_SUCCESS}${OK}${COLOR_DEFAULT} " \
  || echo -e " ${COLOR_DANGER}${FAIL}${COLOR_DEFAULT} "
}