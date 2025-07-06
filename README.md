## Ancient Vim

This is a simple and generic syntax highlight for Vim, in terminal.
It set a highlight pattern color to similar code chunks and specific
syntax pattern to famous code conventions.

## Installing

[vim-plug]: https://github.com/junegunn/vim-plug "Official repository"

> [!IMPORTANT]
> This plugin in based in the structure standard of the plugin manager
> [`vim-plug`][vim-plug], then you must download it to use this plugin.

Add the next chunk to your `.vimrc`:

``` vimscript
call plug#begin()
	" ...
	Plug 'duckafire/ancient-vim'
call plug#end()
```

Then restart your Vim section (exit and reopen it) and run `:PlugInstall`.

Finally increment your `.vimrc` with this command:

``` vimscript
colorscheme ancient
```
Run `:colorscheme ancient` (or restart the Vim section) and enjoy!

## Syntax highlight

### Colors

This plugin use only color from palette of the XTerm ANSI, that it has
x16 colors, x8 to normal characters and x8 to bold characteres.

But it has some changes to terminal that they have a extendend color
support (x256).

> [!TIP]
> For more informations about, you can:
>
> * Run `:h cterm`: shows all colors name of the XTerm ANSI palette.
> * Run `:h group`: shows the generic groups of highlight syntax.
> * Run `:syntax`: shows all highlight groups that are on.
> * See the content of `./colors/ancient.vim`: is not too hard to understand it.

### Pattern

In addition to colors definition, this plugin also set syntax standard
to highlight specific code chunks, based famous code conventions, they
are:

* Functions call and declaration.
* Use of attributes.
* Declaration and use of constants.
* Special number formats:
	* Decimal.
	* Floating point.
	* Binary.
	* Octal.
	* Hexadecimal.
	* Cientific notation.
