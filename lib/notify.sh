notify() {
  termux-toast -b "${hex_color[0]}" -c "${hex_color[1]}" -g top "${file_name} ✅"
  termux-notification --action "termux-open '${file_name}'" --icon "camera_enhance" \
  --image-path "${file_name}" --priority "high" --title "📸 Awesomeshot v${version}"
}