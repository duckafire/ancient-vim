[term-ansi]: https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit "Wikipedia page about"
[vim-plug]: https://junegunn.github.io/vim-plug/ "Official webpage"
[install-vim-plug]: https://junegunn.github.io/vim-plug/installation/ "Official tutorial"

# Ancient Vim

This is a simple and *generic* syntax highlight for Vim, focused in
terminal context. It use only the terminal colors of the [ANSI Pattern][term-ansi].

> [!NOTE]
> The cited pattern do not define the shane of the colors, so you can
> find a lot of different palettes that follow this pattern.

* [Installing](#installing)
	* [With Vim Plug](#with-vim-plug)
	* [Without Vim Plug](#without-vim-plug)
* [Resources](#resources)
	* [Color scheme](#color-scheme)
	* [Syntax matches](#syntax-matches)
* [How to use](#how-to-use)
	* [Highlight style](#highlight-style)
	* [Regex pattern](#regex-pattern)

## Installing

### With Vim Plug

First, install the [Plug Vim][plug-vim] following this [tutorial][install-vim-plug].

Locale the directory of the *configuration file* of the Vim, or
NeoVim, running (in the editor):

``` vimscript
:echo "$MYVIMRC"
```

> [!NOTE]
> Whether *configuration file* is not in the directory, you need to create
> it.

> [!TIP]
> On Vim, the *configuration file* is named as `.vimrc`. Already on
> NeoVim, it can be named as `init.vim` (it use VimScript) or `init.lua`
> (it use Lua).

Then add the code below in your *configuration file* (preferably on top):

``` vimscript
" VimScript
call plug#begin()
	" ...
	Plug 'duckafire/ancient-vim'
call plug#end()
```

``` lua
-- lua
vim.call("plug#begin")

-- vim.fn["plug#"]("...")
vim.fn["plug#"]("duckafire/ancient-vim")

vim.call("plug#end")
```

> [!TIP]
> In `init.lua`, you can store `vim.fn["plug#"]` (that it is
> a Lua function) inside of a identifier, like in this example:
>
> ``` lua
> local Plug = vim.fn["plug#"]
>
> vim.call("plug#begin")
> 	Plug("duckafire/ancient-vim")
> vim.call("plug#end")
> ```

Restart the editor and run the command below:

``` vimscript
:PlugInstall
```

### Without Vim Plug

Move, or copy, the sub-directories of this project (`colors/`, `after/`, ...) to the
*configuration directory* of the editor. It is:

* `$MYVIMRC/.vim`: on Vim.
* `$MYVIMRC`: on NeoVim.

Whether some sub-directory already exists (in the *configuration directory), move only its
content.

> [!NOTE]
> Doing this is not hard, but it is boring, mainly because this have to be done every
> that a new update occur. I recommend that you use the [Vim Plug][vim-plug], this is
> not *expensive*.

## Resources

### Color scheme

Vim has a lot of *syntax highlight groups* that are used to define the highlight of
keyword, operatorsn and similar. Among this groups, they exists the *"generic groups*
that are extended by some *"specific groups*".

> [!NOTE]
> Examples of *generic groups*:
>
> * `Constant`
> * `Number`
> * `Statement`
>
> Examples of *specific groups*:
>
> * `javaConstant`
> * `luaNumber`
> * `cppStatement`

To allow that the style defined by this project can be used, it define a color scheme
named as `ancient`. This allows disable/enable the highlight syntax defined of a easy way.

> [!TYPE]
> See the content of `./colors/ancient.vim` to know more about the style defined to the
> highlight groups. Try the commands below to get more information about the definitions:
>
> * `:hi`
> * `:syntax`
> * `:h cterm`
> * `:h group`

### Syntax matches !!

In addition of the syntax highlight, this project also make available some optional
*syntax matches* to highlight specific patterns, based in programming conventions.
They are:

* Constants: highlight, based in the `Constant` group, identifiers made only of upper case
characters and/or underscores, like `FOO` and `FOO_BAR`.

* Functions, methods and properties: highlight, based in the `Function` group, identifiers
that end with `(` or that start as a method/property (with `.` or `->`), like `foo(` and
`foo.bar`.

* Numbers: highlight, based in the `Number` group, these number notations:
	* Floating: `0.0`; `.0`; `0.`;
	* Binary: `0b`; `0B`;
	* Octal: `0o`; `0O`;
	* Hexadecimal: `0x`; `0X`;
	* Scientific: `0e`; `0E`; `0e+`; `0e-`; `.0e`; `0.0e`;

## How to use

### Highlight style

To enable the color scheme (after install the *package*), just run this command (in the
editor):

``` vimscript
:colorscheme ancient
```

> [!NOTE]
> If you do not enable this color scheme, the other resources of this projects will use the
> syntax highlight defined currently.

> [!TIP]
> Add the commamnd above (no colon) in your *configuration file*, to define this color scheme
> as the default.

Sadly, activating this color scheme may not work in specific sceneries. To circumvent this
problem, you can declare the follow array in your *configuration file*:

``` vimscript
let g:highlight_languages_to_ancient_vim = []
```

It have to contain all languages that have to receive the *ancient highlight* for syntax
keywords, operators, and similar.

### Regex pattern

As said earlier, the highlight of the syntax matches (it make available by this project) is
optional, and disabled by default.

To enable this feature, you need to declare (in your *configuration file*) the array below:

``` vimscript
let g:syntax_matches_languages_to_ancient_vim = []
```

As `g:syntax_matches_languages_to_ancient_vim`, it have to contain all languages that have
to receive the *ancient highlight* for syntax patterns.

> [!TIP]
> Instead of add the same language in both arrays, you can just to add it in:
>
> ``` vimscript
> let g:languages_to_ancient_vim = []
> ```
>
> The languages listes in it will receive it the *ancient highlight* for it all mentioned
> earlier.
