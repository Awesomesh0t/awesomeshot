convertTitleBar(){
  log "Add*titlebar"

  g="#27C93F" #green
  y="#FFBD2E" #yellow
  r="#FF5F56" #red
  b="#282C34" #black

  rad=$( echo "0.0025 * ${width_titlebar} * ${height_titlebar} / 100" | bc )
  br=$( echo "${rad} * 5" | bc )
  x0=$( echo "${rad} * 3" | bc )
  y0=$( echo "${br} * 0.5" | bc )
  x1=$( echo "${x0} + ${rad}" | bc )

  declare -A arr=()
  for i in {0..2}; do
    arr[$i,0]=$x0
    arr[$i,1]=$y0
    arr[$i,2]=$x1
    arr[$i,3]=$y0
    x0=$( echo "${x0} + ${rad} * 3" | bc )
    x1=$( echo "${x0} + ${rad}" | bc)
  done

  #1520x720
  #760x360
  if [[ "${add_on_img}" == "yes" ]]; then  
    magick $file_name -fill $b \
      -background ${titlebar_color} \
      -gravity north \
      -chop 0x$br \
      -splice 0x$br \
      -draw "fill ${r}   circle ${arr[0,0]},${arr[0,1]} ${arr[0,2]},${arr[0,3]}
      fill ${y}   circle ${arr[1,0]},${arr[1,1]} ${arr[1,2]},${arr[1,3]} 
      fill ${g}   circle ${arr[2,0]},${arr[2,1]} ${arr[2,2]},${arr[2,3]}" \
      $file_name
  else
    magick $file_name -fill $b \
      -background ${titlebar_color} \
      -gravity north -splice 0x$br\
      -draw "fill ${r}   circle ${arr[0,0]},${arr[0,1]} ${arr[0,2]},${arr[0,3]}
      fill ${y}   circle ${arr[1,0]},${arr[1,1]} ${arr[1,2]},${arr[1,3]} 
      fill ${g}   circle ${arr[2,0]},${arr[2,1]} ${arr[2,2]},${arr[2,3]}" \
      $file_name
  fi
  check
}

convertTitleBarText() {
  log "Add*titlebar*text"

  echo -n "${titlebar_text}" |
  convert "${file_name}" \
    -gravity "${titlebar_text_position}" \
    -pointsize "${titlebar_text_size}" \
    -fill "${titlebar_text_color}" \
    -undercolor "${titlebar_text_background}" \
    -font "${titlebar_text_font}" \
    -annotate "${titlebar_text_xy}" \
    @- "${file_name}"
  check
}