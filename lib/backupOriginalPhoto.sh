backupOriginalPhoto() {
  setTime start
  log "Backup*original*photo"

  [[ ! -d ${path_backup} ]] && mkdir -p ${path_backup} 2> /dev/null

  cp "${full_file_name}" "${path_backup}"

  if [[ -f ${path_backup}/${file_name_running} ]]; then

    setTime stop
    getTime
    check

  else

    setTime stop
    getTime
    check

  fi
}