# Why the fork?

This is a version of numbertoggle that does not trigger on
`FocusGained`/`FocusLost` events. The reason for this is specific to
`gnome-terminal`. When the setting `org.gnome.desktop.interface locate-pointer`
(*Pointer Location* in the Keyboard & Mouse section of GNOME Tweaks) is set to
`true`, pressing `Ctrl` causes the terminal (though not the terminal window) to
lose focus, which means that numbertoggle is triggered.

 This is merely annoying if one uses `Ctrl` chords frequently, but it's
 actively harmful if one wants to make a binding like the following (as
 suggested in the help file) to manually control relative line number display:

```
    :nnoremap <silent> <C-n> :set relativenumber!<cr>
```

Because numbertoggle triggers on `FocusLost` and `FocusGained`, one would
actually have to input `<C-n-n>` (hold `Ctrl` and press `n` twice) in order to
return to relative line mode after having turned it off. This fork allows
numbertoggle and the `locate-pointer` setting to work in relative harmony.

# numbertoggle


In a buffer with "hybrid" line numbers (`:set number relativenumber`),
numbertoggle switches to absolute line numbers (`:set number norelativenumber`)
automatically when relative numbers don't make sense.

![vim-numbertoggle toggles between "hybrid" and absolute line numbers automatically](https://raw.githubusercontent.com/jeffkreeftmeijer/vim-numbertoggle/cast/toggle.gif)

Relative numbers are used in a buffer that has focus, and is in normal
mode, since that's where you move around. They're turned off when you switch
out of Vim, switch to another split, or when you go into insert mode.

## Installation

Using Vim's package manager:

1. `$ git clone --branch main git@github.com:jeffkreeftmeijer/vim-numbertoggle.git ~/.vim/pack/plugins/start/vim-numbertoggle`
2. `:set number`

Once help tags are generated, you can view the manual with `:help numbertoggle`.

## tmux

If you use tmux, add `set-option -g focus-events on` to your tmux config (`~/.tmux.conf`) (https://github.com/jeffkreeftmeijer/vim-numbertoggle/issues/45).
