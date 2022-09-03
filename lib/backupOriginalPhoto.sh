backupOriginalPhoto() {
  setTime start
  # change_filename_backup=$(echo $1 | sed 's/.png/_backup.png/g')
  # get_filename_suffix=${change_filename_backup##*/}
  file_name_backup=${file_name##*/}

  log "Backup*original*photo"

  [[ ! -d ${path_backup} ]] && mkdir -p ${path_backup} 2> /dev/null

  # cp "${file_name}" "${path_backup}/${get_filename_suffix}"
  cp "${file_name}" "${path_backup}/${file_name_backup}"

  if [ -f ${path_backup}/${file_name_backup} ]; then

    setTime stop
    getTime
    check

  else

    setTime stop
    getTime
    check

  fi
  
  termux-media-scan -r "${path_backup}" &> /dev/null
  termux-media-scan "${path_backup}/${file_name_backup}" &> /dev/null
}
