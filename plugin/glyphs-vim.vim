let s:cpo_save = &cpo
set cpo&vim

" either enable globaly or locally
let g:glyphs_vim_default_enable = get(g:, "glyphs_vim_default_enable", v:false)
let b:glyphs_vim_enable = get(b:, "glyphs_vim_enable", v:false)

function! s:GlyphsVimShouldLoad()
    return !get(g:, 'glyphs_vim_default_enable', v:false)
                \ ||
                \!get(b:, 'glyphs_vim_enable', v:false)
endfunction

function! s:GlyphsVimLoad()
    runtime  plugin/glyphs.vim
    if s:GlyphsVimShouldLoad()
        for [abbrv, sym] in items(g:glyphs_vim_glyphs)
            execute printf(
                        \'noremap! <buffer> <LocalLeader>%s %s',
                        \ abbrv, sym)
        endfor
    endif
endfunction

function! GlyphsVimEnable()
    let b:glyphs_vim_enable = v:true
    call s:GlyphsVimLoad()
endfunction

function! GlyphsVimDisable()
    let b:glyphs_vim_enable = v:false
    for [abbrv, sym] in items(g:glyphs_vim_glyphs)
        execute printf(
                    \'unmap! <buffer> <LocalLeader>%s %s',
                    \ abbrv, sym)
    endfor
endfunction

setlocal matchpairs&vim
setlocal matchpairs+=(:)
setlocal matchpairs+=<:>
setlocal matchpairs+=[:]
setlocal matchpairs+={:}
setlocal matchpairs+=«:»
setlocal matchpairs+=‹:›
setlocal matchpairs+=⁅:⁆
setlocal matchpairs+=⁽:⁾
setlocal matchpairs+=₍:₎
setlocal matchpairs+=⌈:⌉
setlocal matchpairs+=⌊:⌋
setlocal matchpairs+=〈:〉
setlocal matchpairs+=⎛:⎞
setlocal matchpairs+=⎜:⎟
setlocal matchpairs+=⎝:⎠
setlocal matchpairs+=⎡:⎤
setlocal matchpairs+=⎢:⎥
setlocal matchpairs+=⎣:⎦
setlocal matchpairs+=⎧:⎫
setlocal matchpairs+=⎨:⎬
setlocal matchpairs+=⎩:⎭
setlocal matchpairs+=⎪:⎪
setlocal matchpairs+=⎴:⎵
setlocal matchpairs+=❨:❩
setlocal matchpairs+=❪:❫
setlocal matchpairs+=❬:❭
setlocal matchpairs+=❮:❯
setlocal matchpairs+=❰:❱
setlocal matchpairs+=❲:❳
setlocal matchpairs+=❴:❵
setlocal matchpairs+=⟅:⟆
setlocal matchpairs+=⟦:⟧
setlocal matchpairs+=⟨:⟩
setlocal matchpairs+=⟪:⟫
setlocal matchpairs+=⦃:⦄
setlocal matchpairs+=⦅:⦆
setlocal matchpairs+=⦇:⦈
setlocal matchpairs+=⦉:⦊
setlocal matchpairs+=⦋:⦌
setlocal matchpairs+=⦍:⦎
setlocal matchpairs+=⦏:⦐
setlocal matchpairs+=⦑:⦒
setlocal matchpairs+=⦓:⦔
setlocal matchpairs+=⦕:⦖
setlocal matchpairs+=⦗:⦘
setlocal matchpairs+=⸠:⸡
setlocal matchpairs+=⸢:⸣
setlocal matchpairs+=⸤:⸥
setlocal matchpairs+=⸦:⸧
setlocal matchpairs+=⸨:⸩
setlocal matchpairs+=〈:〉
setlocal matchpairs+=《:》
setlocal matchpairs+=「:」
setlocal matchpairs+=『:』
setlocal matchpairs+=【:】
setlocal matchpairs+=〔:〕
setlocal matchpairs+=〖:〗
setlocal matchpairs+=〘:〙
setlocal matchpairs+=〚:〛
setlocal matchpairs+=︗:︘
setlocal matchpairs+=︵:︶
setlocal matchpairs+=︷:︸
setlocal matchpairs+=︹:︺
setlocal matchpairs+=︻:︼
setlocal matchpairs+=︽:︾
setlocal matchpairs+=︿:﹀
setlocal matchpairs+=﹁:﹂
setlocal matchpairs+=﹃:﹄
setlocal matchpairs+=﹇:﹈
setlocal matchpairs+=﹙:﹚
setlocal matchpairs+=﹛:﹜
setlocal matchpairs+=﹝:﹞
setlocal matchpairs+=（:）
setlocal matchpairs+=＜:＞
setlocal matchpairs+=［:］
setlocal matchpairs+=｛:｝
setlocal matchpairs+=｟:｠
setlocal matchpairs+=｢:｣

let &cpo = s:cpo_save
