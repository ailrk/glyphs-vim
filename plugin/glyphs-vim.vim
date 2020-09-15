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
        call extend(g:glyphs_vim_glyphs, g:glyphs_vim_extend_glyphs)
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

function! s:GlyphsVimInit()
    call s:GlyphsVimLoad()
    if g:glyphs_vim_default_enable
        autocmd BufEnter * call s:GlyphsVimLoad()
    endif
endfunction

" command export
command! -nargs=0 GlyphsVimEnable call s:GlyphsVimEnable()
command! -nargs=0 GlyphsVimDisable call s:GlyphsVimDisable()

" init plugin
call s:GlyphsVimInit()

let &cpo = s:cpo_save
