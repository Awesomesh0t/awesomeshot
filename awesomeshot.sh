#!/usr/bin/env bash

: '
|--------------------------------------------------------------------------
| Awesomeshot
|--------------------------------------------------------------------------
|
| A command-line screenshot tool written in bash 5.1.16+.
| https://github.com/mayTermux/awesomeshot
| 
| Copyright (c) 2021 - 2022 xShin
|
'

version=1.2.0

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.config}
config_file="${XDG_CONFIG_HOME}/awesomeshot/awesomeshot.conf"

LC_ALL=C
LANG=C

read -rd "" config <<"EOF"
:'
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
'
screenshot_path="/sdcard/Pictures/ScreenMaster"
convert_to_png="yes"
backup="yes"
path_backup="/sdcard/DCIM/awesomeshot"

:'
|--------------------------------------------------------------------------
| Section: Hex Color
|--------------------------------------------------------------------------
|
| In this section contains of Colors,
| using array as the data type.
|
'
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

:'
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
'
convert_titlebar="yes"
add_on_img="yes"
width_titlebar=500
height_titlebar=1000
titlebar_color="${hex_color[2]}"
convert_titlebar_text="yes"
titlebar_text="Awesomeshot"
titlebar_text_font="Falling-Sky"
titlebar_text_size=30
titlebar_text_color="${hex_color[5]}"
titlebar_text_background="none"
titlebar_text_position="North"
titlebar_text_xy="+0+7"

:'
|--------------------------------------------------------------------------
| Section: ImageMagick Rounded Corner
|--------------------------------------------------------------------------
|
| In this section contains how many rounded corner of image
|
'
convert_rounded="yes"
border_radius=20

:'
|--------------------------------------------------------------------------
| Section: ImageMagick Small Border
|--------------------------------------------------------------------------
|
| In this section contains how the small border is applied, such as:
|   - Color of border
|   - Border size
|
'
convert_small_border="yes"
small_border_color="${hex_color[5]}"
small_border_size=3

:'
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
'
convert_background_border="yes"
background_border_color="none"
background_border_size=50

:'
|--------------------------------------------------------------------------
| Section: ImageMagick Border Gradient as Background of image
|--------------------------------------------------------------------------
|
| In this section contains how the border gradient is applied as background, 
| such as:
|   - Interpolate method
|   - Color Gradient
|
'
convert_border_gradient="yes"
interpolate_method="Saddle"
gradient_color_top_left="${hex_color[8]}"
gradient_color_top_right="${hex_color[9]}"
gradient_color_bottom_right="${hex_color[10]}"
gradient_color_bottom_left="${hex_color[8]}"

:'
|--------------------------------------------------------------------------
| Section: ImageMagick Shadow of image
|--------------------------------------------------------------------------
|
| In this section contains how the shadow is applied, such as:
|   - Shadow color
|   - Shadow size
|
'
convert_shadow="yes"
shadow_color="${hex_color[1]}"
shadow_size="75x30+0+30"

:'
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
'
convert_footer=""
footer_text=" Shot by Awesomeshot"
footer_font="JetBrains-Mono-Medium-Nerd-Font-Complete"
footer_size=25
footer_color="${hex_color[1]}"
footer_background="none"
footer_position="South"
footer_xy="+0+45"

:'
|--------------------------------------------------------------------------
| Section: Open the image when finished editing
|--------------------------------------------------------------------------
|
'
open_image=""
EOF

initColor() {
    COLOR_BASED="\e[39m"
    COLOR_DANGER="\e[91m"
    COLOR_WARNING="\e[93m"
    COLOR_SUCCESS="\e[92m"
    COLOR_SKY="\e[34m"

    COLOR_DEFAULT="\e[39m"
    COLOR_RESET="\033[0m"

    COLOR_WHITE="\e[97m"
    COLOR_BLACK="\e[30m"

    COLOR_RED="\e[31m"
    COLOR_GREEN="\e[32m"
    COLOR_YELLOW="\e[33m"
    COLOR_BLUE="\e[34m"
    COLOR_MAGENTA="\e[35m"
    COLOR_CYAN="\e[36m"

    COLOR_LIGHT_GRAY="\e[37m"
    COLOR_DARK_GRAY="\e[90m"
    COLOR_LIGHT_RED="\e[91m"
    COLOR_LIGHT_GREEN="\e[92m"
    COLOR_LIGHT_YELLOW="\e[93m"
    COLOR_LIGHT_BLUE="\e[94m"
    COLOR_LIGHT_MAGENTA="\e[95m"
    COLOR_LIGHT_CYAN="\e[96m"

    COLOR_BOLD_MAGENTA="\033[1;35m"
    COLOR_BOLD_GREEN="\033[1;32m"
    COLOR_BOLD_WHITE="\033[1;37m"
    COLOR_BOLD_BLUE="\033[1;34m"
    COLOR_BOLD_RED="\033[1;31m"
    COLOR_BOLD_YELLOW="\033[1;33m"
    COLOR_BOLD_CYAN="\033[1;36m"

    COLOR_BACKGROUND_YELLOW="\033[1;43;33m"
    COLOR_BACKGROUND_BLUE="\033[1;44;97m"
    COLOR_BACKGROUND_RED="\033[1;41;97m"
    COLOR_BACKGROUND_WHITE="\033[1;47;37m"
    COLOR_BACKGROUND_BLACK="\033[1;40;30m"

    BLUE=$(tput setaf 4)
    GRAY=$(tput setaf 236)
    RESET=$(tput sgr0)
}

printInfo() {
    echo -e "\n  ${COLOR_BACKGROUND_BLUE} INFO ${COLOR_RESET} Awesomeshot running on listening mode."

echo -e "
  ╭────────────────────────────╮
  │  ⚠ Press ${COLOR_BACKGROUND_RED} CTRL+C ${COLOR_RESET} to stop  │
  ╰────────────────────────────╯
"
}

initVariable() {
    distro=""
}

getDistro() {
    _cmd=$(uname -n)
    if [ $_cmd != "localhost" ]; then
        distro=$(uname)
    elif [[ -d /system/app/ && -d /system/priv-app ]]; then
        distro="Android"
    fi
}

loadConfig() {
    source "${config_file}"
}

printConfig() {
    printf '%s\n' "$config"
}

getUserConfig() {
    if [ -f "${config_file}" ]; then
        loadConfig
    elif [ ! -f "${config_file}" ]; then
        mkdir -p "${XDG_CONFIG_HOME}/awesomeshot/" 2> /dev/null
        printConfig > "$config_file"
        loadConfig
    fi
}

generateDefaultConfig() {
    if [ ! -f "${config_file}" ]; then
        if [ ! -d "${XDG_CONFIG_HOME}/awesomeshot" ]; then
            mkdir -p "${XDG_CONFIG_HOME}/awesomeshot/" 2> /dev/null
        fi
        printConfig > "$config_file"
        echo -e "\n${COLOR_BACKGROUND_BLUE} INFO ${COLOR_RESET}"
        echo -e "
  ╭─────────────────────────────────────╮
  │  Default config has been generated  │
  ╰─────────────────────────────────────╯
        "
        exit
    fi

    if [ -f "${config_file}" ]; then
        echo -e "
  ╭── INFO ─────────────────╮
  │  Config already exists  │
  ╰─────────────────────────╯
        "
        read -p "  Do you want to re-generate default config? [y/n] " ask
        case "${ask}" in
            y|Y )
                printConfig > "$config_file"
                echo -e "
  ╭────────────────────────────────────────╮
  │  Default config has been re-generated  │
  ╰────────────────────────────────────────╯"
            ;;
            n|N )
                exit
            ;;
        esac
    fi
}

printLog() {
    printf "**$(date +${COLOR_DARK_GRAY}%Y-%m-%d*${COLOR_RESET}%H:%M:%S)%-60s" "*${BLUE}${1}${GRAY}*" \
    | sed 's/ /./g' | sed 's/*/ /g'
    check
}

function check() {
  #   
  #   
  if [[ $? -eq 0 && ${PIPESTATUS[0]} -eq 0 ]]; then

    echo -e " ${COLOR_SUCCESS}${COLOR_DEFAULT} "

  else

    echo -e " ${COLOR_DANGER}${COLOR_DEFAULT} "

  fi
}

getAllInit() {
    initColor
    initVariable
}

dump() {
    for((i=0; i <= 10; i++)); do
        printLog "Screenshot-21-1-2_12-2-3.png"
        printLog "Backup*original*photo"
        printLog "Add*titlebar"
        printLog "Add*rounded*corner"
        printLog "Add*small*border"
        printLog "Add*border*as*background"
        printLog "Add*border*gradient*as*background"
        printLog "Add*shadow*image"
        printLog "Add*footer*image"
        sleep 1s
        echo ""
    done
}

getAllInit
# printInfo
getDistro
generateDefaultConfig
dump