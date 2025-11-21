" Color conversion utility functions
function! ColorToHex(color_num)
    if a:color_num < 16
        let basic = ['000000', '800000', '008000', '808000', 
                    \'000080', '800080', '008080', 'c0c0c0',
                    \'808080', 'ff0000', '00ff00', 'ffff00',
                    \'0000ff', 'ff00ff', '00ffff', 'ffffff']
        return '#' . basic[a:color_num]
    elseif a:color_num < 232
        let idx = a:color_num - 16
        let r = idx / 36
        let g = (idx % 36) / 6
        let b = idx % 6
        let r_val = r > 0 ? 55 + r * 40 : 0
        let g_val = g > 0 ? 55 + g * 40 : 0
        let b_val = b > 0 ? 55 + b * 40 : 0
        return printf('#%02x%02x%02x', r_val, g_val, b_val)
    else
        let gray = 8 + (a:color_num - 232) * 10
        return printf('#%02x%02x%02x', gray, gray, gray)
    endif
endfunction

" Command to easily convert colors
command! -nargs=1 HexColor echo ColorToHex(<args>)
