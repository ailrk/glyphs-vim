let s:cpo_save = &cpo
set cpo&vim

runtime  plugin/glyphs.vim

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

if get(g:, 'glyphs_vim_enable', v:true)
    for [sequence, symbol] in items(g:agda#glyphs)
      execute printf('noremap! <buffer> <LocalLeader>%s %s', sequence, symbol)
    endfor
endif

let &cpo = s:cpo_save
