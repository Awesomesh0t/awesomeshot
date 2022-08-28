notify() {
  if [[ ! -d ${path_backup} ]]; then
    latest_file=$(/bin/ls -th ${screenshot_path} | sed -n 1p)
  else
    latest_file=$(/bin/ls -th ${screenshot_path} | sed -n 2p)
  fi
  size=`find ${screenshot_path}/${latest_file} -printf %s`

  if (( ${size} == 0 || ${size} <= 20 )); then
    rm -rf "${screenshot_path}/${latest_file}"
    rm -rf "${path_backup}/${latest_file}"
    notify-send "Awesomeshot" "Improving failed!" -t 3000
    exit 1
  fi
  notify-send -i ${full_file_name} "Awesomeshot" "Improving success!" -t 3000
}