convertToPng() {
  setTime start
  extension="${file_name##*.}"

  if [ "${extension}" != "png" ]; then
    log "Convert*.${extension}*to*png"
    convert "${file_name}" "${file_name%.*}.png"
    rm "${file_name}"
    termux-media-scan "${file_name}" &> /dev/null
    file_name=${file_name%.*}.png
    setTime stop
    getTime
    check
  fi
  
}
