if exists("b:glyphs_vim_done")
    finish
endif
let b:glyphs_vim_done = get("b:glyphs_vim_done", v:true)

let s:cpo_save = &cpo
set cpo&vim

" either enable globaly or locally
let g:glyphs_vim_default_enable = get(g:, "g:glyphs_vim_default_enable", v:false)
let b:glyphs_vim_enable = get(b:, "b:glyphs_vim_enable", v:false)

function s:GlyphsVimShouldLoad()
    return !get(g:, 'glyphs_vim_default_enable', v:false)
                \ ||
                \!get(b:, 'glyphs_vim_enable', v:false)
endfunction

function s:GlyphsVimLoad()
    runtime  plugin/glyphs.vim
    if s:GlyphsVimShouldLoad()
        for [abbrv, sym] in items(g:glyphs_vim#glyphs)
            execute printf(
                        \'noremap! <buffer> <LocalLeader>%s %s',
                        \ abbrv, sym)
        endfor
    endif
endfunction

function! b:GlyphsVimEnable()
    let b:glyphs_vim_enable = v:true
    call s:GlyphsVimLoad()
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

call s:GlyphsVimLoad()
let &cpo = s:cpo_save
