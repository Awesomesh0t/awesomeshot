notify() {
  latest_file=`/bin/ls -th ${screenshot_path} | head -n 1`
  size=`find ${screenshot_path}/${latest_file} -printf %s`

  if (( ${size} == 0 || ${size} <= 20 )); then
    rm -rf "${screenshot_path}/${latest_file}"
    notify-send "Awesomeshot" "Improving failed!" -t 3000
    exit 1
  fi
  notify-send "Awesomeshot" "Improving success!" -t 3000
}