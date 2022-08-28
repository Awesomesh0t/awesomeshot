convertRounded() {
  log "Add*rounded*corner*${1}"

  convert "$file_name" \
    \( +clone -alpha extract -draw \
      "fill black polygon 0,0,0,${border_radius} ${border_radius},0 fill white circle ${border_radius},${border_radius},${border_radius},0" \
      \( +clone -flip \) -compose Multiply -composite \
      \( +clone -flop \) -compose Multiply -composite \
    \) \
    -alpha off -compose CopyOpacity -composite "$file_name"
  check
}