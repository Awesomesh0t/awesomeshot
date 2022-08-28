convertFooter() {
  log "Add*footer*image"

  echo -n "${footer_text}" |
  convert "$file_name" \
    -gravity ${footer_position} \
    -pointsize ${footer_font_size} \
    -fill ${footer_foreground} \
    -undercolor ${footer_background} \
    -font ${footer_font} \
    -annotate ${footer_xy} \
    @- "$file_name"
    
  check
}