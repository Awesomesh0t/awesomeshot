#!/bin/bash

help() {
    echo -e "
  $(version)
  A command-line screenshot tool written in bash 5.1.16+

  Usage:
    awesomeshot [args] [file]

  META OPTIONS:
    -h, --help                Show list of command-line options
    -v, --version             Show version of awesomeshot

  RUN OPTIONS:
    -a, --auto                Run awesomeshot with automatic while take screenshot
    -m, --manual              Run awesomeshot with manual (this option require filename)
    -c, --config              Generate default config awesomeshot.conf

  CONFIG OPTIONS:
    screenshot_result_path    Make sure when your phone screenshot the result file image
                              PATH is same with this variable. Default my phone result file
                              image PATH on '/sdcard/DCIM/Screenshots'. If not same,
                              you can edit this variable value

    convert_to_png            This variable serves to set the convert image with file type non PNG, change this value
                              to blank or whatever for disable function and 'yes' for enable function.
                              Convert to PNG if file not PNG

    backup                    This variable serves to function to backup original photo
                              (screenshot result), change this value to blank or whatever for disable
                              function and 'yes' for enable function

    path_backup               This variable serves to set the original photo backup PATH

    hex_color                 Array Hex Color

    convert_titlebar          This variable serves to convert title bar when editing the image, change this value
                              to blank or whatever for disable convert and 'yes' for enable function

    add_on_img                This variable serves to set where the title bar place, if 'yes' the title bar add on image,
                              if blank or whatever the title bar will be added at out of image

    width_img & height_img    This variable serves to set the width and height size of title bar.
                              NOTE (Bug Found):
                              - Sometimes the title bar result is too big or too small
                              width_img=magick file_name - format '%w' info:
                              height_img=magick file_name - format '%h' info:
                              if (( width_img > height_img )); then
                                height_img=width_img
                              elif (( width_img < height_img )); then
                                width_img=height_img
                              fi

    titlebar_color            This variable serves to set titlebar color, if you want to custom the color, you can
                              change this value with hex color or use the one in the array list.

    convert_titlebar_text     This variable serves to convert the titlebar text, change this value
                              to blank or whatever for disable function and 'yes' for enable function.

    titlebar_text             This variable serves to set titlebar text, if you want to use icon
                              you can search on Nerd Fonts Website (https://www.nerdfonts.com/cheat-sheet)
                              NOTE: if you use icon from Nerd Fonts, make sure 'titlebar_text_font' using nerd fonts to!

    titlebar_text_position    This variable serves to set text position of titlebar text, the value contain 8 wind direction:
                              - NorthWest
                              - North
                              - West
                              - Center
                              - East
                              - SouthWest
                              - South
                              - SouthEast
                              NOTE: Default value is 'North'

    titlebar_text_size        This variable serves to set font size

    titlebar_text_color       This variable serves to set the text color, if you want to custom the color, you can
                              change this value with hex color or use the one in the array list.

    titlebar_text_background  This variable serves to set titlebar text background color (background text), change this value
                              to 'none' for transparent background, if you want to custom the color, you can
                              change this value with hex color or use the one in the array list.

    titlebar_text_font        This variable serves to set the font used when converting, you can check the list font
                              available to use for ImageMagick by command:
                              magick convert -list font | grep -iE 'font:.*'

    titlebar_text_xy          This variable serves to set position of "X" and "Y" titlebar text

    convert_rounded           This variable serves to convert rounded corner, change this value
                              to blank or whatever for disable convert and 'yes' for enable function

    border_radius             This variable serves to set how many rounded corners

    convert_first_border      This variable serves to convert tiny first border (background image) when editing the image,
                              change this value to blank or whatever for disable convert and 'yes' for enable function

    first_border_color        This variable serves to set tiny first border color (background image), change this value
                              to 'none' for transparent background, if you want to custom the color, you can
                              change this value with hex color or use the one in the array list.

    first_border_size         This variable serves to set how many size of the first border
                              NOTE: make sure this value is small, otherwise it will look weird

    convert_second_border     This variable serves to convert border (background image) when editing the image,
                              change this value to blank or whatever for disable convert and 'yes' for enable function

    second_border_color       This variable serves to set border color (background image), change this value
                              to 'none' for transparent background, if you want to custom the color, you can
                              change this value with hex color or use the one in the array list.

    second_border_size        This variable serves to set how many size of the second border

    convert_second_border_gradient This variable severs to convert border with gradient color,
                                   change this value to blank or whatever for disable convert and 'yes' for enable function

    interpolate_method        This variable serves to convert gradient color method
                              More information: https://legacy.imagemagick.org/Usage/misc/
                              List available method:
                              - saddle
                              - mesh

    convert_shadow            This variable serves to convert the shadow of image, change this value
                              to blank or whatever for disable function and 'yes' for enable function.

    shadow_color              This variable serves to set shadow color, if you want to custom the color, you can
                              change this value with hex color or use the one in the array list.

    shadow_size               This variable serves to set shadow size, this variable has four values:
                              shadow_size='75x30+0+30'
                              that mean:
                              - bottom shadow is x75
                              - right shadow is +30
                              - top shadow is +0
                              - left shadow is +30

    convert_footer            This variable serves to convert the footer text, change this value
                              to blank or whatever for disable function and 'yes' for enable function.

    footer_text               This variable serves to set text of footer, if you want to use icon
                              you can search on Nerd Fonts Website (https://www.nerdfonts.com/cheat-sheet)
                              NOTE: if you use icon from Nerd Fonts, make sure 'footer_font' using nerd fonts to!

    footer_position           This variable serves to set text position of footer, the value contain 8 wind direction:
                              - NorthWest
                              - North
                              - West
                              - Center
                              - East
                              - SouthWest
                              - South
                              - SouthEast
                              NOTE: Default value is 'South'

    footer_xy                 This variable serves to set position of 'X' and 'Y'

    footer_font               This variable serves to set the font used when converting, you can check the list font
                              available to use for ImageMagick by command:
                              magick convert -list font | grep -iE 'font:.*'

    footer_font_size          This variable serves to set font size

    footer_foreground         This variable serves to set the text color, if you want to custom the color, you can
                              change this value with hex color or use the one in the array list.

    footer_background         This variable serves to set footer background color (background text), change this value
                              to 'none' for transparent background, if you want to custom the color, you can
                              change this value with hex color or use the one in the array list.

    open_image                This variable serves to open the result of image (when editing finished), change this value
                              to blank or whatever for disable function and 'yes' for enable function.
    "
}