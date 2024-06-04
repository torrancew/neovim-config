function! IsFzf()
  return &ft == 'fzf' || &ft == 'skim'
endfunction

" Execute provided VimScript and preserve cursor position
function! PreserveCursor(code)
  " Save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Make the substitution
  execute a:code
  " Restore last search and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Normalize tabstop, softtabstop and shiftwidth to one value
function! SetTabs()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:sw  = l:tabstop
    let &l:ts  = l:tabstop
  endif
  call SummarizeTabs()
endfunction

" Display current tab settings
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' et'
    else
      echon ' noet'
    endif
  finally
    echohl None
  endtry
endfunction

" Toggle the Solarized Palette
function! ToggleColorPalette()
  let &background = (&background == "dark" ? "light" : "dark")
endfunction
