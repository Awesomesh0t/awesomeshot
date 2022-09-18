#!/bin/bash

convertBorder() {
    case "${1}" in
        "small"|"Small" )
            setTime start
            log "Add*small*border"
            convert "${full_file_name}" -bordercolor "${small_border_color}" -border "${small_border_size}" "${full_file_name}"
            setTime stop
            getTime
            check
            convertRounded "to*small*border"
        ;;
        
        "background"|"Background" )
            setTime start
            log "Add*border*as*background"
            convert "${full_file_name}" -bordercolor "${background_border_color}" -border "${background_border_size}" "${full_file_name}"
            setTime stop
            getTime
            check
        ;;
    esac
}

convertBorderGradient() {
    setTime start
    size_wh=$(identify -format %wx%h ${full_file_name})
    case "${1}" in
        "saddle"|"Saddle" )
            log "Add*border*gradient*${interpolate_method}*as*background"
            
            convert \
            "${full_file_name}" \
            \( \
            \( \
            xc:${gradient_color_top_left} xc:${gradient_color_top_right} +append \
            \) \
            \( \
            xc:${gradient_color_bottom_left} xc:${gradient_color_bottom_right} +append \
            \) -append -size $size_wh \
            xc: +swap -fx 'v.p{i/(w-1),j/(h-1)}' \
            \) \
            -gravity center \
            -compose Dst_Over -composite \
            "${full_file_name}"
        ;;
        
        "mesh"|"Mesh" )
            log "Add*border*gradient*${interpolate_method}*as*background"
            
            convert \
            "${full_file_name}" \
            \( \
            \( \
            xc:${gradient_color_top_left} xc:${gradient_color_top_right} +append \
            \) \
            \( \
            xc:${gradient_color_bottom_left} xc:${gradient_color_bottom_right} +append \
            \) -append -size $size_wh \
            xc: +swap -interpolate ${interpolate_method} -fx 'v.p{i/(w-1),j/(h-1)}' \
            \) \
            -gravity center \
            -compose Dst_Over -composite \
            "${full_file_name}"
        ;;
    esac
    
    setTime stop
    getTime
    check
}