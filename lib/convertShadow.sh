convertShadow() {
  setTime start
  log "Add*shadow*image"

  convert "$file_name" \
    \( \
      +clone \
      -background "${shadow_color}" \
      -shadow "${shadow_size}" \
    \) \
    +swap \
    -background none \
    -layers merge \
    +repage "$file_name"
    
  setTime stop
  getTime
  check
}
