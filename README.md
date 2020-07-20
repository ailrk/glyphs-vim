# A Vim Plugin to help type glyphs easier

## How to use
`:GlyphVimEnable`: enable for current buffer.

`:GlyphVimDisable`: enable for current buffer.

`g:glyph_vim_default_enable`: enable globally.

Use the combination of `<localleader>` + `glyph name` to input a glyph. For instance, if your `<localleader>` is `\`, to input ℕ just type `\N`.

## Demo
[![Demo](https://asciinema.org/a/Slcieff00LVAgQz6Rnzcq85sO.svg)](https://asciinema.org/a/Slcieff00LVAgQz6Rnzcq85sO)


## install
If you are using `vim-plug` add this line to your `.vimrc`
```
Plug "jummy233/glyphs-vim"
```
then run `PlugInstall`
To avoid pollute user binding the plugin is activated on per buffer basis. To enable

## Where to find sequence
Sequences are listed in src file `plugin/glyphs.vim`
