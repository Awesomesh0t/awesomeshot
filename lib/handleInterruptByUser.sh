handleInterruptByUser() {

  logError "error" "" "" "${1}"

  setterm -cursor on

  read -n 1 -s -r -p "   Press any key to exit "

  exit 1

}