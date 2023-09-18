
    let g:startify_session_dir = '~/.config/nvim/session'

    let g:startify_bookmarks = [ 
                \ {'c': '~/.config/nvim/'}, 
                \ {'n': '~/Code/notebook/'}, 
                \ {'b': '~/.config/nvim/lua/zaiquiri/start-screen.vim'}, 
                \ {'i': '~/.bashrc'}, 
                \ '~/code',
                \ ]

    let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
    let g:startify_session_autoload = 1
    let g:startify_files_number = 10
    let g:startify_update_oldfiles = 1
    let g:startify_session_persistence = 1
    let g:startify_session_delete_buffers = 1
    let g:startify_fortune_use_unicode = 1
    let g:startify_padding_left = 3
"     let g:startify_custom_indices = []
" Use any list of strings as indices instead of increasing numbers. If there are
" more startify entries than actual items in the custom list, the remaining
" entries will be filled using the default numbering scheme starting from 0.
"
" Thus you can create your own indexing scheme that fits your keyboard layout.
" You don't want to leave the home row, do you?!
    let g:startify_custom_header = [
      \ '                                                       ___           ',
      \ '                                                    ,o88888          ',
      \ '                                                 ,o8888888\`          ',
      \ '                           ,:o:o:oooo.        ,8O88Pd8888"           ',
      \ '                       ,.::.::o:ooooOoOoO. ,oO8O8Pd888`"             ',
      \ '                     ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"               ',
      \ '                    , ..: ________ OOO8OOOOo.FdO8O8"                 ',
      \ '                   , ..:. |\_____  \ 888O8O,COCOO"                   ',
      \ '                  , . ..:. \|___/  /\ 8OOOOCOCO"                     ',
      \ '                   . ..:.::o:  /  / / O8OCCCC"o                      ',
      \ '                      . ..:.  /  /_/__ oCCC"o:o                      ',
      \ '                      . ..:. |\________\ o"oo:o:                     ',
      \ '                   `   . . .  \|_______| o:o:::`                     ',
      \ '                   .`   . ..::ccccoc"`o:o:o:::`                      ',
      \ '                  :.:.    ,c:cccc"`:.:.:.:.:.`                       ',
      \ '                ..:.:"``::::c:"`..:.:.:.:.:.`                        ',
      \ '              ...:.`.:.::::"`    . . . . .`                          ',
      \ '             .. . ....:."` `   .  . . "`                             ',
      \ '           . . . ...."`                                              ',
      \ '           .. . ."`                                                  ',
      \ '          . "                                                        ',
      \ '  ________  _______   ________  ___      ___ ___  _____ ______       ', 
      \ ' |\_____  \|\  ____\ |\   __  \|\  \    /  /|\  \|\   _ \  _   \     ',
      \ '  \|___/  /\ \  \__| \ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \    ',
      \ '      /  / /\ \   __| \ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \   ',
      \ '     /  /_/__\ \  \__|_\ \  \\\  \ \    / /   \ \  \ \  \    \ \  \  ',
      \ '    |\________\ \_______\ \_______\ \__/ /     \ \__\ \__\    \ \__\ ',
      \ '     \|_______|\|_______|\|_______|\|__|/       \|__|\|__|     \|__| ',
      \ ]
