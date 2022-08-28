handleInterruptByUser() {

  logError "\n\n  error" "${1}" "" "Press any key to exit"

  setCursor on

  read -n 1 -s -r -p ""

  exit 1

}