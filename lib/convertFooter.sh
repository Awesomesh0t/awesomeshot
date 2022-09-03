convertFooter() {
  setTime start
  log "Add*footer*image"

  echo -n "${footer_text}" |
  convert "${full_file_name}" \
    -gravity ${footer_position} \
    -pointsize ${footer_font_size} \
    -fill ${footer_foreground} \
    -undercolor ${footer_background} \
    -font ${footer_font} \
    -annotate ${footer_xy} \
    @- "${full_file_name}"
    
  setTime stop
  getTime
  check
}