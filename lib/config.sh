#!/bin/bash

read -rd "" config <<"EOF"
<<''
|--------------------------------------------------------------------------
| Section: Relate to Image
|--------------------------------------------------------------------------
|
| In this section contains images, such as:
|   - Screenshot PATH
|   - Image will be convert to PNG if not PNG
|   - Backup original image (before edited)
|   - Backup PATH
|

screenshot_path="${HOME}/Pictures/Awesomeshot"
if [[ ${full_name} == "yes" ]]; then
    file_name_running="Screenshot_`date "+%Y-%m-%d_%H-%M-%S"`.png"
    full_file_name="${screenshot_path}/${file_name_running}"
else
    file_name_running="${file_name##*/}"
    full_file_name="${file_name}"
fi
convert_to_png="yes"
backup="yes"
path_backup="${screenshot_path}/Backup"

<<''
|--------------------------------------------------------------------------
| Section: Hex Color
|--------------------------------------------------------------------------
|
| In this section contains of Colors,
| using array as the data type.
|

hex_color=(
  "#F8F9FA" # white
  "#000000" # black
  "#282C34" # black-gray
  "#333333" # gray
  "#A8D7FE" # blue sky
  "#6D6B70" # another gray
  "#726A7B" # slate gray
  "#A2AAAD"
  # Color for gradient
  "#C850C0"
  "#FFCC70"
  "#4158D0"
  "#FE7FAA"
)

<<''
|--------------------------------------------------------------------------
| Section: ImageMagick Titlebar
|--------------------------------------------------------------------------
|
| In this section contains how titlebar will be create, such as:
|   - Add on image (titlebar will be added at out of image)
|   - Width & Height of titlebar
|   - Color of titlebar
|   - Text of titlebar
|   - Font of text
|   - Text size
|   - Text color
|   - Text background color
|   - Text position
|   - Font position (x, y)
|

convert_titlebar="yes"
add_on_img=""
width_titlebar=300
height_titlebar=800
titlebar_color="${hex_color[2]}"
convert_titlebar_text="yes"
titlebar_text="Awesomeshot"
titlebar_text_font="Falling-Sky"
titlebar_text_size=19
titlebar_text_color="${hex_color[5]}"
titlebar_text_background="none"
titlebar_text_position="North"
titlebar_text_xy="+0+2"

<<''
|--------------------------------------------------------------------------
| Section: ImageMagick Rounded Corner
|--------------------------------------------------------------------------
|
| In this section contains how many rounded corner of image
|

convert_rounded="yes"
border_radius=20

<<''
|--------------------------------------------------------------------------
| Section: ImageMagick Small Border
|--------------------------------------------------------------------------
|
| In this section contains how the small border is applied, such as:
|   - Color of border
|   - Border size
|

convert_small_border="yes"
small_border_color="${hex_color[5]}"
small_border_size=3

<<''
|--------------------------------------------------------------------------
| Section: ImageMagick Border as Background of image
|--------------------------------------------------------------------------
|
| In this section contains how the border is applied as background, such as:
|   ╭── NOTE ────────────────────────────────────────────────────────────────╮
|   │ if `convert_background_border` is enable and `background_border_color` │
|   │ value is not "none" will be conflict with `gradient_border` if enable  │
|   ╰────────────────────────────────────────────────────────────────────────╯
|   - Color of border
|   - Border size
|

convert_background_border="yes"
background_border_color="none"
background_border_size=15

<<''
|--------------------------------------------------------------------------
| Section: ImageMagick Border Gradient as Background of image
|--------------------------------------------------------------------------
|
| In this section contains how the border gradient is applied as background,
| such as:
|   - Interpolate method
|   - Color Gradient
|

convert_border_gradient="yes"
interpolate_method="Saddle"
gradient_color_top_left="${hex_color[8]}"
gradient_color_top_right="${hex_color[9]}"
gradient_color_bottom_right="${hex_color[8]}"
gradient_color_bottom_left="${hex_color[10]}"

<<''
|--------------------------------------------------------------------------
| Section: ImageMagick Shadow of image
|--------------------------------------------------------------------------
|
| In this section contains how the shadow is applied, such as:
|   - Shadow color
|   - Shadow size
|

convert_shadow="yes"
shadow_color="${hex_color[1]}"
shadow_size="75x30+0+30"

<<''
|--------------------------------------------------------------------------
| Section: ImageMagick Footer of image
|--------------------------------------------------------------------------
|
| In this section contains how the footer is applied, such as:
|   - Footer text
|   - Footer font
|   - Footer size
|   - Footer color
|   - Footer background color
|   - Footer position
|   - Footer position (x, y)
|

convert_footer=""
footer_text=" Shot by Awesomeshot"
footer_font="JetBrains-Mono-Medium-Nerd-Font-Complete"
footer_size=25
footer_color="${hex_color[1]}"
footer_background="none"
footer_position="South"
footer_xy="+0+45"

<<''
|--------------------------------------------------------------------------
| Section: Open the image when finished editing
|--------------------------------------------------------------------------
|

open_image=""
EOF

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.config}
config_file="${XDG_CONFIG_HOME}/awesomeshot/awesomeshot.conf"

loadConfig() {
    source "${config_file}"
}

printConfig() {
    printf '%s\n' "${config}"
}

createDirectory() {
    mkdir -p "${XDG_CONFIG_HOME}/awesomeshot/" 2> /dev/null
}

getUserConfig() {
    if [[ -f ${config_file} ]]; then
        loadConfig
    else
        createDirectory
        printConfig > "${config_file}"
        loadConfig
    fi
    checkConfig
}

generateDefaultConfig() {
    if [[ ! -f ${config_file} ]]; then
        if [[ ! -d "${XDG_CONFIG_HOME}/awesomeshot" ]]; then
            createDirectory
        fi
        printConfig > "${config_file}"
        echo -e "\n  ${COLOR_BACKGROUND_BLUE} INFO ${COLOR_RESET}"
        echo -e "
  ╭─────────────────────────────────────╮
  │  Default config has been generated  │
  ╰─────────────────────────────────────╯
        "
        exit
    fi
    
    if [[ -f ${config_file} ]]; then
        echo -e "\n  ${COLOR_BACKGROUND_BLUE} INFO ${COLOR_RESET}"
        echo -e "
  ╭─────────────────────────╮
  │  Config already exists  │
  ╰─────────────────────────╯
        "
        read -p "  Do you want to re-generate default config? [y/n] " ask
        case "${ask}" in
            
            "" )
                echo -e "
  ╭────────────────╮
  │  Nothing todo  │
  ╰────────────────╯
                "
            ;;
            
            y|Y )
                printConfig > "$config_file"
                echo -e "
  ╭────────────────────────────────────────╮
  │  Default config has been re-generated  │
  ╰────────────────────────────────────────╯
                "
            ;;
            
            n|N )
                exit
            ;;
            
            * )
                logError "error" "Uknown Answer '${ask}'" "" "Please input the correct answer"
            ;;
        esac
    fi
}
