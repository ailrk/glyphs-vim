let s:cpo_save = &cpo
set cpo&vim

" either enable globaly or locally
let g:glyphs_vim_default_enable = get(g:, "glyphs_vim_default_enable", v:false)
let b:glyphs_vim_enable = get(b:, "glyphs_vim_enable", v:false)

function! s:GlyphsVimShouldLoad()
    return get(g:, 'glyphs_vim_default_enable', v:false)
                \ ||
                \get(b:, 'glyphs_vim_enable', v:false)
endfunction

function! s:GlyphsVimLoad()
    if s:GlyphsVimShouldLoad()
        runtime plugin/glyphs.vim
        runtime plugin/glyphs-pair.vim
        for [abbrv, sym] in items(g:glyphs_vim_glyphs)
            execute printf(
                        \'noremap! <buffer> <LocalLeader>%s %s',
                        \ abbrv, sym)
        endfor
    endif
endfunction

function! s:GlyphsVimEnable()
    let b:glyphs_vim_enable = v:true
    silent call s:GlyphsVimLoad()
endfunction

function! s:GlyphsVimDisable_()
    let b:glyphs_vim_enable = v:false
    for [abbrv, _] in items(g:glyphs_vim_glyphs)
        execute printf(
                    \'unmap! <buffer> <LocalLeader>%s',
                    \ abbrv)
    endfor
endfunction
function! s:GlyphsVimDisable()
    silent! call s:GlyphsVimDisable_()
endfunction

" command export
command! -buffer -nargs=0 GlyphsVimEnable call s:GlyphsVimEnable()
command! -buffer -nargs=0 GlyphsVimDisable call s:GlyphsVimDisable()

" init plugin
call s:GlyphsVimLoad()

let &cpo = s:cpo_save
