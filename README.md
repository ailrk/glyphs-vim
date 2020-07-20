# A Plugin For typing glyphs easier in vim

## install
If you are using `vim-plug` add this line to your `.vimrc`
```
Plug "jummy233/glyphs-vim"
```
then run `PlugInstall`

The plugin is disabled by default, to enable in the current buffer call
```
:call GlyphsVimEnable
```

Use the combination of `<localleader>` + `glyph name` to input a glyph. For instance, if your `<localleader>` is `\`, to input ℕ just type `\N`.

