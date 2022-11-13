version 6.0
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-G>Þ <Nop>
inoremap <silent> <C-G> <Cmd>lua require("which-key").show("\7", {mode = "i", auto = true})
inoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
cnoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
imap <C-G>S <Plug>ISurround
imap <C-G>s <Plug>Isurround
imap <C-S> <Plug>Isurround
inoremap <silent> <expr> <Plug>(sexp_insert_backspace) sexp#backspace_insertion()
inoremap <silent> <expr> <Plug>(sexp_insert_double_quote) sexp#quote_insertion('"')
inoremap <silent> <expr> <Plug>(sexp_insert_closing_curly) sexp#closing_insertion('}')
inoremap <silent> <expr> <Plug>(sexp_insert_closing_square) sexp#closing_insertion(']')
inoremap <silent> <expr> <Plug>(sexp_insert_closing_round) sexp#closing_insertion(')')
inoremap <silent> <expr> <Plug>(sexp_insert_opening_curly) sexp#opening_insertion('{')
inoremap <silent> <expr> <Plug>(sexp_insert_opening_square) sexp#opening_insertion('[')
inoremap <silent> <expr> <Plug>(sexp_insert_opening_round) sexp#opening_insertion('(')
imap <silent> <C-G>% <Plug>(matchup-c_g%)
inoremap <silent> <Plug>(matchup-c_g%) :call matchup#motion#insert_mode()
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <silent> <expr> <Plug>delimitMateS-BS delimitMate#WithinEmptyPair() ? "\<Del>" : "\<S-BS>"
inoremap <silent> <Plug>delimitMateBS =delimitMate#BS()
imap <M-Bslash> <Plug>(copilot-suggest)
imap <M-[> <Plug>(copilot-previous)
imap <M-]> <Plug>(copilot-next)
imap <Plug>(copilot-suggest) <Cmd>call copilot#Suggest()
imap <Plug>(copilot-previous) <Cmd>call copilot#Previous()
imap <Plug>(copilot-next) <Cmd>call copilot#Next()
imap <Plug>(copilot-dismiss) <Cmd>call copilot#Dismiss()
noremap! <silent> <Plug>luasnip-expand-repeat <Cmd>lua require'luasnip'.expand_repeat()
noremap! <silent> <Plug>luasnip-delete-check <Cmd>lua require'luasnip'.unlink_current_if_deleted()
inoremap <silent> <Plug>luasnip-jump-prev <Cmd>lua require'luasnip'.jump(-1)
inoremap <silent> <Plug>luasnip-jump-next <Cmd>lua require'luasnip'.jump(1)
inoremap <silent> <Plug>luasnip-prev-choice <Cmd>lua require'luasnip'.change_choice(-1)
inoremap <silent> <Plug>luasnip-next-choice <Cmd>lua require'luasnip'.change_choice(1)
inoremap <silent> <Plug>luasnip-expand-snippet <Cmd>lua require'luasnip'.expand()
inoremap <silent> <Plug>luasnip-expand-or-jump <Cmd>lua require'luasnip'.expand_or_jump()
inoremap <C-S-W> <Cmd>BufferClose!
inoremap <C-S-W> <Cmd>BufferClose!
inoremap <M-Tab> <Cmd>BufferMoveNext
inoremap <C-S-Tab> <Cmd>BufferPrevious
inoremap <C-Tab> <Cmd>BufferNext
inoremap <M-b> <Cmd>lua vim.lsp.buf.definition()
inoremap <M-CR> :CodeActionMenu
inoremap <C-L> :call unicoder#start(1)
inoremap <C-S--> <Cmd>lua require('fold-cycle').close_all()
inoremap <C-S-+> <Cmd>lua require('fold-cycle').open_all()
inoremap <C--> <Cmd>lua require('fold-cycle').close()
inoremap <C-+> <Cmd>lua require('fold-cycle').open()
inoremap <C-W> <Cmd>BufferClose
inoremap <C-U> u
xnoremap <silent>  <Cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), true, 450)
nnoremap <silent>  <Cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), true, 450)
xnoremap <silent>  <Cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 250)
nnoremap <silent>  <Cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 250)
xnoremap <silent>  <Cmd>lua require('neoscroll').scroll(0.10, false, 100)
nnoremap <silent>  <Cmd>lua require('neoscroll').scroll(0.10, false, 100)
xnoremap <silent>  <Cmd>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0), true, 450)
nnoremap <silent>  <Cmd>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0), true, 450)
vnoremap  :call unicoder#selection()
nnoremap  :call unicoder#start(0)
xmap <nowait>  <Plug>(VM-Find-Subword-Under)
nmap <nowait>  <Plug>(VM-Find-Under)
nmap  <Plug>(RepeatRedo)
xnoremap <silent>  <Cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 250)
nnoremap <silent>  <Cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 250)
tnoremap  <Cmd>BufferClose
map  <Cmd>BufferClose
xnoremap <silent>  <Cmd>lua require('neoscroll').scroll(-0.10, false, 100)
nnoremap <silent>  <Cmd>lua require('neoscroll').scroll(-0.10, false, 100)
nnoremap <silent> !aÞ <Nop>
nnoremap <silent> !iÞ <Nop>
nnoremap <silent> !Þ <Nop>
nnoremap <silent> ! <Cmd>lua require("which-key").show("!", {mode = "n", auto = true})
nnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "n", auto = true})
xnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "v", auto = true})
xnoremap # y?\V"
omap <silent> % <Ignore><Plug>(matchup-%)
xmap <silent> % <Plug>(matchup-%)
nmap <silent> % <Plug>(matchup-%)
nnoremap & :&&
nnoremap <silent> ' <Cmd>lua require("which-key").show("'", {mode = "n", auto = true})
xnoremap * y/\V"
nnoremap <silent> ,tÞ <Nop>
nnoremap <silent> ,FÞ <Nop>
nnoremap <silent> ,dÞ <Nop>
nnoremap <silent> ,loÞ <Nop>
nnoremap <silent> ,lwÞ <Nop>
nnoremap <silent> ,lÞ <Nop>
nnoremap <silent> ,ghÞ <Nop>
nnoremap <silent> ,gÞ <Nop>
nnoremap <silent> ,eÞ <Nop>
nnoremap <silent> ,iÞ <Nop>
nnoremap <silent> ,nÞ <Nop>
nnoremap <silent> ,BÞ <Nop>
nnoremap <silent> ,mÞ <Nop>
nnoremap <silent> ,fÞ <Nop>
nnoremap <silent> ,Þ <Nop>
nnoremap <silent> , <Cmd>lua require("which-key").show(",", {mode = "n", auto = true})
xnoremap <silent> ,eÞ <Nop>
xnoremap <silent> ,Þ <Nop>
xnoremap <silent> , <Cmd>lua require("which-key").show(",", {mode = "v", auto = true})
vnoremap <silent> ,a :CodeActionMenu
vnoremap <silent> ,ee <Cmd>lua require'sniprun'.run('v')
vmap <silent> ,i <Plug>VimspectorBalloonEval
vnoremap <silent> ,g Gitsigns select_hunk
nnoremap <silent> ,ir :lua MyIMG.renameUnderCursorFromFilesystem()
nnoremap <silent> ,ic :lua colorpicker()
nnoremap <silent> ,id :lua MyIMG.deleteUnderCursorFromFilesystem()
nnoremap <silent> ,iv :lua MyIMG.showUnderCursor(70,70)
nnoremap <silent> ,ip :PasteImg
nnoremap <silent> ,is :!maim -su | xclip -selection clipboard -t image/png
nnoremap <silent> ,Fb :Neotree buffers toggle float
nnoremap <silent> ,Ff :Neotree filesystem toggle left
nnoremap <silent> ,Fg :Neotree git_status toggle right
nnoremap <silent> ,dt :Neogen type
nnoremap <silent> ,dF :Neogen file
nnoremap <silent> ,dd :Neogen
nnoremap <silent> ,df :Neogen func
nnoremap <silent> ,dc :Neogen class
nnoremap <silent> ,lR <Cmd>lua vim.lsp.buf.references()
nnoremap <silent> ,lf <Cmd>lua vim.lsp.buf.format { async = true }
nnoremap <silent> ,ll <Cmd>lua vim.diagnostic.open_float()
nnoremap <silent> ,lA :CodeActionMenu
nnoremap <silent> ,ld <Cmd>lua vim.lsp.buf.definition()
nnoremap <silent> ,lh <Cmd>lua vim.lsp.buf.hover()
nnoremap <silent> ,lD <Cmd>lua vim.lsp.buf.declaration()
nnoremap <silent> ,ln <Cmd>lua vim.diagnostic.goto_next()
nnoremap <silent> ,lS <Cmd>lua vim.diagnostic.set_loclist()
nnoremap <silent> ,li <Cmd>lua vim.lsp.buf.implementation()
nnoremap <silent> ,la <Cmd>lua vim.lsp.buf.code_action()
nnoremap <silent> ,lp <Cmd>lua vim.diagnostic.goto_prev()
nnoremap <silent> ,lor <Cmd>TroubleToggle
nnoremap <silent> ,lod <Cmd>TroubleToggle
nnoremap <silent> ,loo <Cmd>TroubleToggle
nnoremap <silent> ,log <Cmd>lua trouble.open_with_trouble
nnoremap <silent> ,low <Cmd>TroubleToggle
nnoremap <silent> ,loq <Cmd>TroubleToggle
nnoremap <silent> ,lol <Cmd>TroubleToggle
nnoremap <silent> ,lr <Cmd>lua vim.lsp.buf.rename()
nnoremap <silent> ,lt <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <silent> ,lwa <Cmd>lua vim.lsp.buf.add_workspace_folder()
nnoremap <silent> ,lwr <Cmd>lua vim.lsp.buf.remove_workspace_folder()
nnoremap <silent> ,lwl <Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
nnoremap <silent> ,ls <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <silent> ,gx <Cmd>lua package.loaded.gitsigns.toggle_delete()
nnoremap <silent> ,gb <Cmd>lua package.loaded.gitsigns.blame_line()
nnoremap <silent> ,gd <Cmd>lua package.loaded.gitsigns.diffthis()
nnoremap <silent> ,gD <Cmd>lua package.loaded.gitsigns.diffthis('~')
nnoremap <silent> ,ghr :Gitsigns reset_hunk
nnoremap <silent> ,ghu <Cmd>lua package.loaded.gitsigns.undo_stage_hunk()
nnoremap <silent> ,ghp <Cmd>lua package.loaded.gitsigns.preview_hunk()
nnoremap <silent> ,ghs :Gitsigns stage_hunk
nnoremap <silent> ,gr <Cmd>lua package.loaded.gitsigns.reset_buffer()
nnoremap <silent> ,gB <Cmd>lua package.loaded.gitsigns.blame_line{full=true}
nnoremap <silent> ,gt <Cmd>lua package.loaded.gitsigns.toggle_current_line_blame()
nnoremap <silent> ,gs <Cmd>lua package.loaded.gitsigns.stage_buffer()
nnoremap <silent> ,er <Cmd>lua require'sniprun'.reset()
nnoremap <silent> ,ex <Cmd>lua require'sniprun.display'.close()
nnoremap <silent> ,ei <Cmd>lua require'sniprun'.info()
nnoremap <silent> ,el <Cmd>lua require'sniprun.live_mode'.toggle()
nnoremap <silent> ,ee <Cmd>lua require'sniprun'.run()
nnoremap <silent> ,ec <Cmd>lua require'sniprun'.clear_repl()
nnoremap <silent> ,mo :lua require('codewindow').open_minimap()
nnoremap <silent> ,mm :lua require('codewindow').toggle_focus()
nnoremap <silent> ,mf :lua require('codewindow').toggle_minimap()
nnoremap <silent> ,mc :lua require('codewindow').close_minimap()
nnoremap <silent> ,c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"
nnoremap <silent> ,np <Cmd>lua require('nabla').popup()
nnoremap <silent> ,na <Cmd>lua require('nabla').action()
nnoremap <silent> ,Bn <Cmd>BufferNext
nnoremap <silent> ,BP <Cmd>BufferMovePrevious
nnoremap <silent> ,Bp <Cmd>BufferPrevious
nnoremap <silent> ,Bl :Buffers
nnoremap <silent> ,BN <Cmd>BufferMoveNext
nnoremap <silent> ,Bc <Cmd>BufferClose
nnoremap <silent> ,tn :TestNearest
nnoremap <silent> ,tl :TestLast
nnoremap <silent> ,tv :TestVisit
nnoremap <silent> ,tf :TestFile
nnoremap <silent> ,ts :TestSuite
nnoremap <silent> ,z :Twilight
nnoremap <silent> ,a :CodeActionMenu
nnoremap <silent> ,fo <Cmd>lua require('fold-cycle').open()
nnoremap <silent> ,fb <Cmd>Telescope buffers
nnoremap <silent> ,ft <Cmd>lua require('fold-cycle').toggle_all()
nnoremap <silent> ,fg <Cmd>Telescope live_grep
nnoremap <silent> ,fh <Cmd>Telescope help_tags
nnoremap <silent> ,ff <Cmd>Telescope find_files
nnoremap <silent> ,fc <Cmd>lua require('fold-cycle').close()
nnoremap ,? :Cheatsheet
nnoremap <silent> -rÞ <Nop>
nnoremap <silent> -lÞ <Nop>
nnoremap <silent> -dBÞ <Nop>
nnoremap <silent> -dsÞ <Nop>
nnoremap <silent> -dfÞ <Nop>
nnoremap <silent> -dSÞ <Nop>
nnoremap <silent> -dÞ <Nop>
nnoremap <silent> -eÞ <Nop>
nnoremap <silent> -jdÞ <Nop>
nnoremap <silent> -jÞ <Nop>
nnoremap <silent> -cÞ <Nop>
nnoremap <silent> -Þ <Nop>
nnoremap <silent> - <Cmd>lua require("which-key").show("-", {mode = "n", auto = true})
nmap <silent> -rr <Plug>SlimeRegionSend
nmap <silent> -rp <Plug>SlimeParagraphSend
nmap <silent> -rc <Plug>SlimeConfig
nnoremap <silent> -cp :!pandoc % -o %:r.pdf
nnoremap <silent> -ch :!pandoc % -o %:r.html
nmap <silent> -dfd <Plug>VimspectorDownFrame
nmap <silent> -dfu <Plug>VimspectorUpFrame
nmap <silent> -db <Plug>VimspectorToggleBreakpoint
nmap <silent> -dsO <Plug>VimspectorStepOut
nmap <silent> -dso <Plug>VimspectorStepOver
nmap <silent> -dsi <Plug>VimspectorStepInto
nnoremap <silent> -dl :call vimspector#Launch()
nmap <silent> -dSr <Plug>VimsspectorRestart
nnoremap <silent> -dSL :VimspectorLoadSession
nnoremap <silent> -dSS :VimspectorMkSession
nmap <silent> -dSs <Plug>VimspectorStop
nmap <silent> -dL <Plug>VimspectorGoToCurrentLine
nmap <silent> -dc <Plug>VimspectorContinue
nmap <silent> -dBl <Plug>VimspectorBreakpoints
nmap <silent> -dBc <Plug>VimspectorToggleConditionalBreakpoint
nmap <silent> -dBf <Plug>VimspectorAddFunctionBreakpoint
nnoremap <silent> -dBC :call vimspector#ClearBreakpoints()
nmap <silent> -di <Plug>VimspectorBalloonEval
nmap <silent> -dp <Plug>VimspectorPause
nmap <silent> -dC <Plug>VimspectorRunToCursor
nnoremap <silent> -jV <Cmd>lua require'jdtls'.extract_variable(true)
nnoremap <silent> -jo <Cmd>lua require'jdtls'.organize_imports()
nnoremap <silent> -jdm <Cmd>lua require'jdtls'.test_nearest_method()
nnoremap <silent> -jdc <Cmd>lua require'jdtls'.test_class()
nnoremap <silent> -jv <Cmd>lua require'jdtls'.extract_variable()
nnoremap <silent> -jC <Cmd>lua require'jdtls'.extract_constant(true)
nnoremap <silent> -jm <Cmd>lua require'jdtls'.extract_method(true)
nnoremap <silent> -jc <Cmd>lua require'jdtls'.extract_constant(true)
nmap . <Plug>(RepeatDot)
nnoremap 0 ^
nnoremap <silent> <aÞ <Nop>
nnoremap <silent> <iÞ <Nop>
nnoremap <silent> <Þ <Nop>
nnoremap <silent> < <Cmd>lua require("which-key").show("<", {mode = "n", auto = true})
nnoremap <silent> >aÞ <Nop>
nnoremap <silent> >iÞ <Nop>
nnoremap <silent> >Þ <Nop>
nnoremap <silent> > <Cmd>lua require("which-key").show(">", {mode = "n", auto = true})
nnoremap <silent> @Þ <Nop>
nnoremap <silent> @ <Cmd>lua require("which-key").show("@", {mode = "n", auto = true})
xmap S <Plug>VSurround
nmap U <Plug>(RepeatUndoLine)
nnoremap Y y$
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
omap <silent> [% <Plug>(matchup-[%)
xmap <silent> [% <Plug>(matchup-[%)
nmap <silent> [% <Plug>(matchup-[%)
nnoremap <silent> \\gÞ <Nop>
nnoremap <silent> \\Þ <Nop>
nnoremap <silent> \Þ <Nop>
nnoremap <silent> \ <Cmd>lua require("which-key").show("\\", {mode = "n", auto = true})
xnoremap <silent> \\Þ <Nop>
xnoremap <silent> \Þ <Nop>
xnoremap <silent> \ <Cmd>lua require("which-key").show("\\", {mode = "v", auto = true})
xmap <nowait> \\c <Plug>(VM-Visual-Cursors)
nmap <nowait> \\gS <Plug>(VM-Reselect-Last)
nmap <nowait> \\/ <Plug>(VM-Start-Regex-Search)
nmap <nowait> \\\ <Plug>(VM-Add-Cursor-At-Pos)
xmap <nowait> \\a <Plug>(VM-Visual-Add)
xmap <nowait> \\f <Plug>(VM-Visual-Find)
xmap <nowait> \\/ <Plug>(VM-Visual-Regex)
xmap <nowait> \\A <Plug>(VM-Visual-All)
nmap <nowait> \\A <Plug>(VM-Select-All)
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
omap <silent> ]% <Plug>(matchup-]%)
xmap <silent> ]% <Plug>(matchup-]%)
nmap <silent> ]% <Plug>(matchup-]%)
nnoremap ^ 0
nnoremap <silent> ` <Cmd>lua require("which-key").show("`", {mode = "n", auto = true})
xnoremap <silent> aÞ <Nop>
xnoremap <silent> a <Cmd>lua require("which-key").show("a", {mode = "v", auto = true})
omap <silent> a% <Plug>(matchup-a%)
xmap <silent> a% <Plug>(matchup-a%)
nnoremap <silent> caÞ <Nop>
nnoremap <silent> ciÞ <Nop>
nnoremap <silent> cÞ <Nop>
nnoremap <silent> c <Cmd>lua require("which-key").show("c", {mode = "n", auto = true})
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nnoremap <silent> dÞ <Nop>
nnoremap <silent> d <Cmd>lua require("which-key").show("d", {mode = "n", auto = true})
nnoremap <silent> daÞ <Nop>
nnoremap <silent> diÞ <Nop>
nmap ds <Plug>Dsurround
nnoremap <silent> dm  <Cmd>lua require'marks'.delete_buf()
nnoremap <silent> dm= <Cmd>lua require'marks'.delete_bookmark()
nnoremap <silent> dm2 <Cmd>lua require'marks'.delete_bookmark2()
nnoremap <silent> dm3 <Cmd>lua require'marks'.delete_bookmark3()
nnoremap <silent> dm9 <Cmd>lua require'marks'.delete_bookmark9()
nnoremap <silent> dm7 <Cmd>lua require'marks'.delete_bookmark7()
nnoremap <silent> dm1 <Cmd>lua require'marks'.delete_bookmark1()
nnoremap <silent> dm0 <Cmd>lua require'marks'.delete_bookmark0()
nnoremap <silent> dm- <Cmd>lua require'marks'.delete_line()
nnoremap <silent> dm8 <Cmd>lua require'marks'.delete_bookmark8()
nnoremap <silent> dm <Cmd>lua require'marks'.delete()
nnoremap <silent> dm6 <Cmd>lua require'marks'.delete_bookmark6()
nnoremap <silent> dm5 <Cmd>lua require'marks'.delete_bookmark5()
nnoremap <silent> dm4 <Cmd>lua require'marks'.delete_bookmark4()
nnoremap <silent> g~aÞ <Nop>
nnoremap <silent> g~iÞ <Nop>
nnoremap <silent> g~Þ <Nop>
nnoremap <silent> guaÞ <Nop>
nnoremap <silent> guiÞ <Nop>
nnoremap <silent> guÞ <Nop>
nnoremap <silent> gUaÞ <Nop>
nnoremap <silent> gUiÞ <Nop>
nnoremap <silent> gUÞ <Nop>
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
nnoremap <silent> gB <Cmd>BufferNext
nnoremap <silent> gb <Cmd>BufferPrevious
xmap gS <Plug>VgSurround
omap <silent> g% <Ignore><Plug>(matchup-g%)
xmap <silent> g% <Plug>(matchup-g%)
nmap <silent> g% <Plug>(matchup-g%)
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xnoremap <silent> iÞ <Nop>
xnoremap <silent> i <Cmd>lua require("which-key").show("i", {mode = "v", auto = true})
omap <silent> i% <Plug>(matchup-i%)
xmap <silent> i% <Plug>(matchup-i%)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <silent> m[ <Cmd>lua require'marks'.prev()
nnoremap <silent> m <Cmd>lua require'marks'.set()
nnoremap <silent> m3 <Cmd>lua require'marks'.set_bookmark3()
nnoremap <silent> m; <Cmd>lua require'marks'.toggle()
nnoremap <silent> m2 <Cmd>lua require'marks'.set_bookmark2()
nnoremap <silent> m5 <Cmd>lua require'marks'.set_bookmark5()
nnoremap <silent> m9 <Cmd>lua require'marks'.set_bookmark9()
nnoremap <silent> m1 <Cmd>lua require'marks'.set_bookmark1()
nnoremap <silent> m8 <Cmd>lua require'marks'.set_bookmark8()
nnoremap <silent> m: <Cmd>lua require'marks'.preview()
nnoremap <silent> m0 <Cmd>lua require'marks'.set_bookmark0()
nnoremap <silent> m7 <Cmd>lua require'marks'.set_bookmark7()
nnoremap <silent> m6 <Cmd>lua require'marks'.set_bookmark6()
nnoremap <silent> m, <Cmd>lua require'marks'.set_next()
nnoremap <silent> m{ <Cmd>lua require'marks'.prev_bookmark()
nnoremap <silent> m} <Cmd>lua require'marks'.next_bookmark()
nnoremap <silent> m] <Cmd>lua require'marks'.next()
nnoremap <silent> m4 <Cmd>lua require'marks'.set_bookmark4()
nmap u <Plug>(RepeatUndo)
nnoremap <silent> vÞ <Nop>
nnoremap <silent> v <Cmd>lua require("which-key").show("v", {mode = "n", auto = true})
nnoremap <silent> vaÞ <Nop>
nnoremap <silent> viÞ <Nop>
nnoremap <silent> yÞ <Nop>
nnoremap <silent> y <Cmd>lua require("which-key").show("y", {mode = "n", auto = true})
nnoremap <silent> yaÞ <Nop>
nnoremap <silent> yiÞ <Nop>
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <silent> zfaÞ <Nop>
nnoremap <silent> zfiÞ <Nop>
nnoremap <silent> zfÞ <Nop>
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
xnoremap <silent> zÞ <Nop>
xnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "v", auto = true})
omap <silent> z% <Plug>(matchup-z%)
xmap <silent> z% <Plug>(matchup-z%)
nmap <silent> z% <Plug>(matchup-z%)
xnoremap <silent> zt <Cmd>lua require('neoscroll').zt(250)
nnoremap <silent> zt <Cmd>lua require('neoscroll').zt(250)
xnoremap <silent> zb <Cmd>lua require('neoscroll').zb(250)
nnoremap <silent> zb <Cmd>lua require('neoscroll').zb(250)
xnoremap <silent> zz <Cmd>lua require('neoscroll').zz(250)
nnoremap <silent> zz <Cmd>lua require('neoscroll').zz(250)
nnoremap <silent> <SNR>81_OperatoÞ <Nop>
nnoremap <silent> <SNR>81_OperatÞ <Nop>
nnoremap <silent> <SNR>81_OperaÞ <Nop>
nnoremap <silent> <SNR>81_OperÞ <Nop>
nnoremap <silent> <SNR>81_OpeÞ <Nop>
nnoremap <silent> <SNR>81_OpÞ <Nop>
nnoremap <silent> <SNR>81_OÞ <Nop>
nnoremap <silent> <SNR>81_Þ <Nop>
nnoremap <silent> <SNR>81Þ <Nop>
nnoremap <silent> <SNR>8Þ <Nop>
nnoremap <silent> <SNR>72_(wiseÞ <Nop>
nnoremap <silent> <SNR>72_(wisÞ <Nop>
nnoremap <silent> <SNR>72_(wiÞ <Nop>
nnoremap <silent> <SNR>72_(wÞ <Nop>
nnoremap <silent> <SNR>72_(Þ <Nop>
nnoremap <silent> <SNR>72_Þ <Nop>
nnoremap <silent> <SNR>72Þ <Nop>
nnoremap <silent> <SNR>7Þ <Nop>
nnoremap <silent> <SNR>67_:Þ <Nop>
nnoremap <silent> <SNR>67_Þ <Nop>
nnoremap <silent> <SNR>67Þ <Nop>
nnoremap <silent> <SNR>6Þ <Nop>
nnoremap <silent> <SNR>Þ <Nop>
nnoremap <silent> <SNR> <Cmd>lua require("which-key").show("��R", {mode = "n", auto = true})
xnoremap <silent> <SNR>81_OperatoÞ <Nop>
xnoremap <silent> <SNR>81_OperatÞ <Nop>
xnoremap <silent> <SNR>81_OperaÞ <Nop>
xnoremap <silent> <SNR>81_OperÞ <Nop>
xnoremap <silent> <SNR>81_OpeÞ <Nop>
xnoremap <silent> <SNR>81_OpÞ <Nop>
xnoremap <silent> <SNR>81_OÞ <Nop>
xnoremap <silent> <SNR>81_Þ <Nop>
xnoremap <silent> <SNR>81Þ <Nop>
xnoremap <silent> <SNR>8Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-[%Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-[Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-z%Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-zÞ <Nop>
xnoremap <silent> <SNR>72_(matchup-]%Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-]Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-Z%Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-ZÞ <Nop>
xnoremap <silent> <SNR>72_(matchup-g%Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-gÞ <Nop>
xnoremap <silent> <SNR>72_(matchup-%Þ <Nop>
xnoremap <silent> <SNR>72_(matchup-Þ <Nop>
xnoremap <silent> <SNR>72_(matchupÞ <Nop>
xnoremap <silent> <SNR>72_(matchuÞ <Nop>
xnoremap <silent> <SNR>72_(matchÞ <Nop>
xnoremap <silent> <SNR>72_(matcÞ <Nop>
xnoremap <silent> <SNR>72_(matÞ <Nop>
xnoremap <silent> <SNR>72_(maÞ <Nop>
xnoremap <silent> <SNR>72_(mÞ <Nop>
xnoremap <silent> <SNR>72_(Þ <Nop>
xnoremap <silent> <SNR>72_Þ <Nop>
xnoremap <silent> <SNR>72Þ <Nop>
xnoremap <silent> <SNR>7Þ <Nop>
xnoremap <silent> <SNR>Þ <Nop>
xnoremap <silent> <SNR> <Cmd>lua require("which-key").show("��R", {mode = "v", auto = true})
nnoremap <silent> <Plug>VimspectorDisassemble :call vimspector#ShowDisassembly()
nnoremap <silent> <Plug>VimspectorBreakpoints :call vimspector#ListBreakpoints()
nnoremap <silent> <Plug>VimspectorJumpToProgramCounter :call vimspector#JumpToProgramCounter()
nnoremap <silent> <Plug>VimspectorPause :call vimspector#Pause()
nnoremap <silent> <Plug>VimspectorRestart :call vimspector#Restart()
nnoremap <silent> <Plug>VimspectorStop :call vimspector#Stop()
nnoremap <silent> <Plug>VimspectorLaunch :call vimspector#Launch( v:true )
nmap <nowait> <C-Down> <Plug>(VM-Add-Cursor-Down)
xmap <nowait> <C-N> <Plug>(VM-Find-Subword-Under)
nmap <nowait> <C-Up> <Plug>(VM-Add-Cursor-Up)
nmap <nowait> <S-Right> <Plug>(VM-Select-l)
nmap <nowait> <S-Left> <Plug>(VM-Select-h)
nmap <nowait> <C-N> <Plug>(VM-Find-Under)
nnoremap <silent> <Plug>(VM-Select-BBW) :call vm#commands#motion('BBW', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-gE) :call vm#commands#motion('gE', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-ge) :call vm#commands#motion('ge', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-E) :call vm#commands#motion('E', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-e) :call vm#commands#motion('e', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-B) :call vm#commands#motion('B', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-b) :call vm#commands#motion('b', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-W) :call vm#commands#motion('W', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-w) :call vm#commands#motion('w', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-l) :call vm#commands#motion('l', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-k) :call vm#commands#motion('k', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-j) :call vm#commands#motion('j', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-h) :call vm#commands#motion('h', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Mouse-Column) :call vm#commands#mouse_column()
nmap <silent> <Plug>(VM-Mouse-Word) <Plug>(VM-Left-Mouse)<Plug>(VM-Find-Under)
nmap <silent> <Plug>(VM-Mouse-Cursor) <Plug>(VM-Left-Mouse)<Plug>(VM-Add-Cursor-At-Pos)
nnoremap <silent> <Plug>(VM-Left-Mouse) <LeftMouse>
xnoremap <silent> <Plug>(VM-Visual-Regex) :call vm#commands#find_by_regex(2):call feedkeys('/', 'n')
nnoremap <silent> <Plug>(VM-Slash-Search) @=vm#commands#find_by_regex(3)
nnoremap <silent> <Plug>(VM-Start-Regex-Search) @=vm#commands#find_by_regex(1)
nnoremap <silent> <Plug>(VM-Find-Under) :call vm#commands#ctrln(v:count1)
xnoremap <silent> <Plug>(VM-Visual-Reduce) :call vm#visual#reduce()
xnoremap <silent> <Plug>(VM-Visual-Add) :call vm#commands#visual_add()
xnoremap <silent> <Plug>(VM-Visual-Cursors) :call vm#commands#visual_cursors()
nnoremap <silent> <Plug>(VM-Select-All) :call vm#commands#find_all(0, 1)
nnoremap <silent> <Plug>(VM-Reselect-Last) :call vm#commands#reselect_last()
nnoremap <silent> <Plug>(VM-Select-Cursor-Up) :call vm#commands#add_cursor_up(1, v:count1)
nnoremap <silent> <Plug>(VM-Select-Cursor-Down) :call vm#commands#add_cursor_down(1, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-Up) :call vm#commands#add_cursor_up(0, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-Down) :call vm#commands#add_cursor_down(0, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-At-Word) :call vm#commands#add_cursor_at_word(1, 1)
nnoremap <silent> <Plug>(VM-Add-Cursor-At-Pos) :call vm#commands#add_cursor_at_pos(0)
xmap <silent> <expr> <Plug>(VM-Visual-Find) vm#operators#find(1, 1)
nnoremap <silent> <Plug>SurroundRepeat .
noremap <SNR>81_Operator :call slime#store_curpos():set opfunc=slime#send_opg@
xnoremap <silent> <Plug>(sexp_capture_next_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'v', 1, 1)
xnoremap <silent> <Plug>(sexp_capture_prev_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'v', 0, 1)
xnoremap <silent> <Plug>(sexp_emit_tail_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'v', 1, 0)
xnoremap <silent> <Plug>(sexp_emit_head_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'v', 0, 0)
xnoremap <silent> <Plug>(sexp_swap_element_forward) :call sexp#docount(v:prevcount, 'sexp#swap_element', 'v', 1, 0)
xnoremap <silent> <Plug>(sexp_swap_element_backward) :call sexp#docount(v:prevcount, 'sexp#swap_element', 'v', 0, 0)
xnoremap <silent> <Plug>(sexp_swap_list_forward) :call sexp#docount(v:prevcount, 'sexp#swap_element', 'v', 1, 1)
xnoremap <silent> <Plug>(sexp_swap_list_backward) :call sexp#docount(v:prevcount, 'sexp#swap_element', 'v', 0, 1)
xnoremap <silent> <Plug>(sexp_raise_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#raise', 'v', '')
xnoremap <silent> <Plug>(sexp_raise_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#raise', 'v', '')
xnoremap <silent> <Plug>(sexp_curly_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '{', '}', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_curly_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '{', '}', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_square_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '[', ']', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_square_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '[', ']', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_round_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '(', ')', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_round_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '(', ')', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_curly_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '{', '}', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_curly_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '{', '}', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_square_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '[', ']', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_square_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '[', ']', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_round_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '(', ')', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_round_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '(', ')', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_select_next_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'v', 1)
nnoremap <silent> <Plug>(sexp_select_next_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'n', 1)
xnoremap <silent> <Plug>(sexp_select_prev_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'v', 0)
nnoremap <silent> <Plug>(sexp_select_prev_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'n', 0)
xnoremap <silent> <Plug>(sexp_move_to_next_top_element) :call sexp#move_to_adjacent_element('v', v:prevcount, 1, 0, 1)
nnoremap <silent> <Plug>(sexp_move_to_next_top_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#move_to_adjacent_element('n', b:sexp_count, 1, 0, 1)
xnoremap <silent> <Plug>(sexp_move_to_prev_top_element) :call sexp#move_to_adjacent_element('v', v:prevcount, 0, 0, 1)
nnoremap <silent> <Plug>(sexp_move_to_prev_top_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#move_to_adjacent_element('n', b:sexp_count, 0, 0, 1)
xnoremap <silent> <Plug>(sexp_flow_to_next_leaf_tail) :call sexp#leaf_flow('v', v:prevcount, 1, 1)
nnoremap <silent> <Plug>(sexp_flow_to_next_leaf_tail) :let b:sexp_count = v:count | call sexp#leaf_flow('n', b:sexp_count, 1, 1)
xnoremap <silent> <Plug>(sexp_flow_to_prev_leaf_tail) :call sexp#leaf_flow('v', v:prevcount, 0, 1)
nnoremap <silent> <Plug>(sexp_flow_to_prev_leaf_tail) :let b:sexp_count = v:count | call sexp#leaf_flow('n', b:sexp_count, 0, 1)
xnoremap <silent> <Plug>(sexp_flow_to_next_leaf_head) :call sexp#leaf_flow('v', v:prevcount, 1, 0)
nnoremap <silent> <Plug>(sexp_flow_to_next_leaf_head) :let b:sexp_count = v:count | call sexp#leaf_flow('n', b:sexp_count, 1, 0)
xnoremap <silent> <Plug>(sexp_flow_to_prev_leaf_head) :call sexp#leaf_flow('v', v:prevcount, 0, 0)
nnoremap <silent> <Plug>(sexp_flow_to_prev_leaf_head) :let b:sexp_count = v:count | call sexp#leaf_flow('n', b:sexp_count, 0, 0)
xnoremap <silent> <Plug>(sexp_flow_to_next_close) :call sexp#list_flow('v', v:prevcount, 1, 1)
nnoremap <silent> <Plug>(sexp_flow_to_next_close) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#list_flow('n', b:sexp_count, 1, 1)
xnoremap <silent> <Plug>(sexp_flow_to_next_open) :call sexp#list_flow('v', v:prevcount, 1, 0)
nnoremap <silent> <Plug>(sexp_flow_to_next_open) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#list_flow('n', b:sexp_count, 1, 0)
xnoremap <silent> <Plug>(sexp_flow_to_prev_open) :call sexp#list_flow('v', v:prevcount, 0, 0)
nnoremap <silent> <Plug>(sexp_flow_to_prev_open) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#list_flow('n', b:sexp_count, 0, 0)
xnoremap <silent> <Plug>(sexp_flow_to_prev_close) :call sexp#list_flow('v', v:prevcount, 0, 1)
nnoremap <silent> <Plug>(sexp_flow_to_prev_close) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#list_flow('n', b:sexp_count, 0, 1)
xnoremap <silent> <Plug>(sexp_move_to_next_element_tail) :call sexp#move_to_adjacent_element('v', v:prevcount, 1, 1, 0)
nnoremap <silent> <Plug>(sexp_move_to_next_element_tail) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('n', b:sexp_count, 1, 1, 0)
xnoremap <silent> <Plug>(sexp_move_to_prev_element_tail) :call sexp#move_to_adjacent_element('v', v:prevcount, 0, 1, 0)
nnoremap <silent> <Plug>(sexp_move_to_prev_element_tail) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('n', b:sexp_count, 0, 1, 0)
xnoremap <silent> <Plug>(sexp_move_to_next_element_head) :call sexp#move_to_adjacent_element('v', v:prevcount, 1, 0, 0)
nnoremap <silent> <Plug>(sexp_move_to_next_element_head) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('n', b:sexp_count, 1, 0, 0)
xnoremap <silent> <Plug>(sexp_move_to_prev_element_head) :call sexp#move_to_adjacent_element('v', v:prevcount, 0, 0, 0)
nnoremap <silent> <Plug>(sexp_move_to_prev_element_head) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('n', b:sexp_count, 0, 0, 0)
xnoremap <silent> <Plug>(sexp_move_to_next_bracket) :call sexp#docount(v:prevcount, 'sexp#move_to_nearest_bracket', 'v', 1)
nnoremap <silent> <Plug>(sexp_move_to_next_bracket) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#move_to_nearest_bracket', 'n', 1)
xnoremap <silent> <Plug>(sexp_move_to_prev_bracket) :call sexp#docount(v:prevcount, 'sexp#move_to_nearest_bracket', 'v', 0)
nnoremap <silent> <Plug>(sexp_move_to_prev_bracket) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#move_to_nearest_bracket', 'n', 0)
xnoremap <silent> <Plug>(sexp_inner_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_element('v', 1)
xnoremap <silent> <Plug>(sexp_outer_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_element('v', 0)
xnoremap <silent> <Plug>(sexp_inner_string) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_string('v', 1)
xnoremap <silent> <Plug>(sexp_outer_string) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_string('v', 0)
xnoremap <silent> <Plug>(sexp_inner_top_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_top_list('v', 1)
xnoremap <silent> <Plug>(sexp_outer_top_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_top_list('v', 0)
xnoremap <silent> <Plug>(sexp_inner_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_current_list', 'v', 1, 1)
xnoremap <silent> <Plug>(sexp_outer_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_current_list', 'v', 0, 1)
nmap <C-R> <Plug>(RepeatRedo)
nnoremap <silent> <Plug>(RepeatRedo) :call repeat#wrap("\<C-R>",v:count)
nnoremap <silent> <Plug>(RepeatUndoLine) :call repeat#wrap('U',v:count)
nnoremap <silent> <Plug>(RepeatUndo) :call repeat#wrap('u',v:count)
nnoremap <silent> <Plug>(RepeatDot) :if !repeat#run(v:count)|echoerr repeat#errmsg()|endif
nmap <silent> <2-LeftMouse> <Plug>(matchup-double-click)
nnoremap <Plug>(matchup-reload) :MatchupReload
nnoremap <silent> <Plug>(matchup-double-click) :call matchup#text_obj#double_click()
onoremap <silent> <Plug>(matchup-a%) :call matchup#text_obj#delimited(0, 0, 'delim_all')
onoremap <silent> <Plug>(matchup-i%) :call matchup#text_obj#delimited(1, 0, 'delim_all')
xnoremap <silent> <Plug>(matchup-a%) :call matchup#text_obj#delimited(0, 1, 'delim_all')
xnoremap <silent> <Plug>(matchup-i%) :call matchup#text_obj#delimited(1, 1, 'delim_all')
onoremap <silent> <Plug>(matchup-Z%) :call matchup#motion#op('Z%')
xnoremap <silent> <SNR>72_(matchup-Z%) :call matchup#motion#jump_inside_prev(1)
nnoremap <silent> <Plug>(matchup-Z%) :call matchup#motion#jump_inside_prev(0)
onoremap <silent> <Plug>(matchup-z%) :call matchup#motion#op('z%')
xnoremap <silent> <SNR>72_(matchup-z%) :call matchup#motion#jump_inside(1)
nnoremap <silent> <Plug>(matchup-z%) :call matchup#motion#jump_inside(0)
onoremap <silent> <Plug>(matchup-[%) :call matchup#motion#op('[%')
onoremap <silent> <Plug>(matchup-]%) :call matchup#motion#op(']%')
xnoremap <silent> <SNR>72_(matchup-[%) :call matchup#motion#find_unmatched(1, 0)
xnoremap <silent> <SNR>72_(matchup-]%) :call matchup#motion#find_unmatched(1, 1)
nnoremap <silent> <Plug>(matchup-[%) :call matchup#motion#find_unmatched(0, 0)
nnoremap <silent> <Plug>(matchup-]%) :call matchup#motion#find_unmatched(0, 1)
onoremap <silent> <Plug>(matchup-g%) :call matchup#motion#op('g%')
xnoremap <silent> <SNR>72_(matchup-g%) :call matchup#motion#find_matching_pair(1, 0)
onoremap <silent> <Plug>(matchup-%) :call matchup#motion#op('%')
xnoremap <silent> <SNR>72_(matchup-%) :call matchup#motion#find_matching_pair(1, 1)
nnoremap <silent> <Plug>(matchup-g%) :call matchup#motion#find_matching_pair(0, 0)
nnoremap <silent> <Plug>(matchup-%) :call matchup#motion#find_matching_pair(0, 1)
nnoremap <silent> <expr> <SNR>72_(wise) empty(g:v_motion_force) ? 'v' : g:v_motion_force
nnoremap <silent> <Plug>(matchup-hi-surround) :call matchup#matchparen#highlight_surrounding()
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
nnoremap <Plug>NvimagerRefresh :NvimagerRefresh
nnoremap <Plug>NvimagerToggle :NvimagerToggle
nnoremap <Plug>(Marks-prev-bookmark9) <Cmd> lua require'marks'.prev_bookmark9()
nnoremap <Plug>(Marks-next-bookmark9) <Cmd> lua require'marks'.next_bookmark9()
nnoremap <Plug>(Marks-delete-bookmark9) <Cmd> lua require'marks'.delete_bookmark9()
nnoremap <Plug>(Marks-set-bookmark9) <Cmd> lua require'marks'.set_bookmark9()
nnoremap <Plug>(Marks-prev-bookmark8) <Cmd> lua require'marks'.prev_bookmark8()
nnoremap <Plug>(Marks-next-bookmark8) <Cmd> lua require'marks'.next_bookmark8()
nnoremap <Plug>(Marks-delete-bookmark8) <Cmd> lua require'marks'.delete_bookmark8()
nnoremap <Plug>(Marks-set-bookmark8) <Cmd> lua require'marks'.set_bookmark8()
nnoremap <Plug>(Marks-prev-bookmark7) <Cmd> lua require'marks'.prev_bookmark7()
nnoremap <Plug>(Marks-next-bookmark7) <Cmd> lua require'marks'.next_bookmark7()
nnoremap <Plug>(Marks-delete-bookmark7) <Cmd> lua require'marks'.delete_bookmark7()
nnoremap <Plug>(Marks-set-bookmark7) <Cmd> lua require'marks'.set_bookmark7()
nnoremap <Plug>(Marks-prev-bookmark6) <Cmd> lua require'marks'.prev_bookmark6()
nnoremap <Plug>(Marks-next-bookmark6) <Cmd> lua require'marks'.next_bookmark6()
nnoremap <Plug>(Marks-delete-bookmark6) <Cmd> lua require'marks'.delete_bookmark6()
nnoremap <Plug>(Marks-set-bookmark6) <Cmd> lua require'marks'.set_bookmark6()
nnoremap <Plug>(Marks-prev-bookmark5) <Cmd> lua require'marks'.prev_bookmark5()
nnoremap <Plug>(Marks-next-bookmark5) <Cmd> lua require'marks'.next_bookmark5()
nnoremap <Plug>(Marks-delete-bookmark5) <Cmd> lua require'marks'.delete_bookmark5()
nnoremap <Plug>(Marks-set-bookmark5) <Cmd> lua require'marks'.set_bookmark5()
nnoremap <Plug>(Marks-prev-bookmark4) <Cmd> lua require'marks'.prev_bookmark4()
nnoremap <Plug>(Marks-next-bookmark4) <Cmd> lua require'marks'.next_bookmark4()
nnoremap <Plug>(Marks-delete-bookmark4) <Cmd> lua require'marks'.delete_bookmark4()
nnoremap <Plug>(Marks-set-bookmark4) <Cmd> lua require'marks'.set_bookmark4()
nnoremap <Plug>(Marks-prev-bookmark3) <Cmd> lua require'marks'.prev_bookmark3()
nnoremap <Plug>(Marks-next-bookmark3) <Cmd> lua require'marks'.next_bookmark3()
nnoremap <Plug>(Marks-delete-bookmark3) <Cmd> lua require'marks'.delete_bookmark3()
nnoremap <Plug>(Marks-set-bookmark3) <Cmd> lua require'marks'.set_bookmark3()
nnoremap <Plug>(Marks-prev-bookmark2) <Cmd> lua require'marks'.prev_bookmark2()
nnoremap <Plug>(Marks-next-bookmark2) <Cmd> lua require'marks'.next_bookmark2()
nnoremap <Plug>(Marks-delete-bookmark2) <Cmd> lua require'marks'.delete_bookmark2()
nnoremap <Plug>(Marks-set-bookmark2) <Cmd> lua require'marks'.set_bookmark2()
nnoremap <Plug>(Marks-prev-bookmark1) <Cmd> lua require'marks'.prev_bookmark1()
nnoremap <Plug>(Marks-next-bookmark1) <Cmd> lua require'marks'.next_bookmark1()
nnoremap <Plug>(Marks-delete-bookmark1) <Cmd> lua require'marks'.delete_bookmark1()
nnoremap <Plug>(Marks-set-bookmark1) <Cmd> lua require'marks'.set_bookmark1()
nnoremap <Plug>(Marks-prev-bookmark0) <Cmd> lua require'marks'.prev_bookmark0()
nnoremap <Plug>(Marks-next-bookmark0) <Cmd> lua require'marks'.next_bookmark0()
nnoremap <Plug>(Marks-delete-bookmark0) <Cmd> lua require'marks'.delete_bookmark0()
nnoremap <Plug>(Marks-set-bookmark0) <Cmd> lua require'marks'.set_bookmark0()
nnoremap <Plug>(Marks-prev-bookmark) <Cmd> lua require'marks'.prev_bookmark()
nnoremap <Plug>(Marks-next-bookmark) <Cmd> lua require'marks'.next_bookmark()
nnoremap <Plug>(Marks-delete-bookmark) <Cmd> lua require'marks'.delete_bookmark()
nnoremap <Plug>(Marks-prev) <Cmd> lua require'marks'.prev()
nnoremap <Plug>(Marks-next) <Cmd> lua require'marks'.next()
nnoremap <Plug>(Marks-preview) <Cmd> lua require'marks'.preview()
nnoremap <Plug>(Marks-deletebuf) <Cmd> lua require'marks'.delete_buf()
nnoremap <Plug>(Marks-deleteline) <Cmd> lua require'marks'.delete_line()
nnoremap <Plug>(Marks-delete) <Cmd> lua require'marks'.delete()
nnoremap <Plug>(Marks-toggle) <Cmd> lua require'marks'.toggle()
nnoremap <Plug>(Marks-setnext) <Cmd> lua require'marks'.set_next()
nnoremap <Plug>(Marks-set) <Cmd> lua require'marks'.set()
snoremap <silent> <Plug>luasnip-jump-prev <Cmd>lua require'luasnip'.jump(-1)
snoremap <silent> <Plug>luasnip-jump-next <Cmd>lua require'luasnip'.jump(1)
snoremap <silent> <Plug>luasnip-prev-choice <Cmd>lua require'luasnip'.change_choice(-1)
snoremap <silent> <Plug>luasnip-next-choice <Cmd>lua require'luasnip'.change_choice(1)
snoremap <silent> <Plug>luasnip-expand-snippet <Cmd>lua require'luasnip'.expand()
snoremap <silent> <Plug>luasnip-expand-or-jump <Cmd>lua require'luasnip'.expand_or_jump()
noremap <silent> <Plug>luasnip-expand-repeat <Cmd>lua require'luasnip'.expand_repeat()
noremap <silent> <Plug>luasnip-delete-check <Cmd>lua require'luasnip'.unlink_current_if_deleted()
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
map <F9> :!nix build
nnoremap <F3> :TodoTelescope
nnoremap <F2> :SymbolsOutline
nnoremap <F1> :Neotree filesystem toggle left
tnoremap <C-S-L> <Cmd>:wincmd l
tnoremap <C-S-L> <Cmd>:wincmd l
tnoremap <C-S-K> <Cmd>:wincmd j
tnoremap <C-S-K> <Cmd>:wincmd j
tnoremap <C-S-J> <Cmd>:wincmd k
tnoremap <S-NL> <Cmd>:wincmd k
tnoremap <C-S-H> <Cmd>:wincmd h
tnoremap <C-S-H> <Cmd>:wincmd h
map <C-S-L> <Cmd>:wincmd l
map <C-S-L> <Cmd>:wincmd l
map <C-S-K> <Cmd>:wincmd j
map <C-S-K> <Cmd>:wincmd j
map <C-S-J> <Cmd>:wincmd k
map <S-NL> <Cmd>:wincmd k
map <C-S-H> <Cmd>:wincmd h
map <C-S-H> <Cmd>:wincmd h
tnoremap <C-S-W> <Cmd>BufferClose!"}}}
tnoremap <C-S-W> <Cmd>BufferClose!"}}}
tnoremap <C-W> <Cmd>BufferClose
tnoremap <M-S-Tab> <Cmd>BufferMovePrevious
tnoremap <M-Tab> <Cmd>BufferMoveNext
tnoremap <C-S-Tab> <Cmd>BufferPrevious
tnoremap <C-Tab> <Cmd>BufferNext
map <C-S-W> <Cmd>BufferClose!
map <C-S-W> <Cmd>BufferClose!
map <C-W> <Cmd>BufferClose
map <M-S-Tab> <Cmd>BufferMovePrevious
map <M-Tab> <Cmd>BufferMoveNext
map <C-S-Tab> <Cmd>BufferPrevious
map <C-Tab> <Cmd>BufferNext
nnoremap <M-b> <Cmd>lua vim.lsp.buf.definition()
nnoremap <M-CR> :CodeActionMenu
vnoremap <C-L> :call unicoder#selection()
nnoremap <C-S--> <Cmd>lua require('fold-cycle').close_all()
nnoremap <C-S-+> <Cmd>lua require('fold-cycle').open_all()
nnoremap <C--> <Cmd>lua require('fold-cycle').close()
nnoremap <C-+> <Cmd>lua require('fold-cycle').open()
nmap <silent> <Plug>SnipClose :lua require'sniprun.display'.close_all()
nmap <silent> <Plug>SnipReplMemoryClean :lua require'sniprun'.clear_repl()
nmap <Plug>SnipInfo :lua require'sniprun'.info()
nmap <silent> <Plug>SnipReset :lua require'sniprun'.reset()
nmap <silent> <Plug>SnipRTerminate :lua require'sniprun'.terminate()
nmap <silent> <Plug>SnipRunOperator :set opfunc=SnipRunOperatorg@
nmap <silent> <Plug>SnipRun :lua require'sniprun'.run()
vmap <silent> <Plug>SnipRun :lua require'sniprun'.run('v')
xnoremap <silent> <C-F> <Cmd>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0), true, 450)
nnoremap <silent> <C-F> <Cmd>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0), true, 450)
xnoremap <silent> <C-D> <Cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 250)
nnoremap <silent> <C-D> <Cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 250)
xnoremap <silent> <C-U> <Cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 250)
nnoremap <silent> <C-U> <Cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 250)
xnoremap <silent> <C-B> <Cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), true, 450)
nnoremap <silent> <C-B> <Cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), true, 450)
xnoremap <silent> <C-E> <Cmd>lua require('neoscroll').scroll(0.10, false, 100)
nnoremap <silent> <C-E> <Cmd>lua require('neoscroll').scroll(0.10, false, 100)
xnoremap <silent> <C-Y> <Cmd>lua require('neoscroll').scroll(-0.10, false, 100)
nnoremap <silent> <C-Y> <Cmd>lua require('neoscroll').scroll(-0.10, false, 100)
nnoremap <silent> <LeftRelease> <Cmd>lua require("gesture").finish()
nnoremap <silent> <LeftDrag> <Cmd>lua require("gesture").draw()
nnoremap <C-L> :call unicoder#start(0)
inoremap <silent> Þ <Nop>
inoremap <silent>  <Cmd>lua require("which-key").show("\7", {mode = "i", auto = true})
imap S <Plug>ISurround
imap s <Plug>Isurround
imap <silent> % <Plug>(matchup-c_g%)
inoremap  :call unicoder#start(1)
inoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
cnoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
imap  <Plug>Isurround
inoremap  u
inoremap  <Cmd>BufferClose
nmap ß {
nmap ä ]
nmap ü [
nmap ö '
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamedplus
set completeopt=menu,menuone,noselect
set expandtab
set helplang=de
set ignorecase
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=,:
set lazyredraw
set listchars=nbsp:+,space:⋅,tab:>\ ,trail:-
set mouse=a
set packpath=/nix/store/ihrj05j47h91ym4qmbl4m0w9n9p8ks2l-vim-pack-dir,~/.config/nvim,/etc/xdg/nvim,~/.nix-profile/etc/xdg/nvim,/etc/profiles/per-user/luca/etc/xdg/nvim,/nix/var/nix/profiles/default/etc/xdg/nvim,/run/current-system/sw/etc/xdg/nvim,~/.local/share/nvim/site,/nix/store/m8i15rddjlp6lx6g2f60jz7s06ycazk1-patchelf-0.15.0/share/nvim/site,/nix/store/qh0hdh1zb513my7s48r3qp78lg8f97yb-desktops/share/nvim/site,~/.nix-profile/share/nvim/site,/etc/profiles/per-user/luca/share/nvim/site,/nix/var/nix/profiles/default/share/nvim/site,/run/current-system/sw/share/nvim/site,/nix/store/r5ybaiyajgpzqys0fag0fnkfr0ark5kx-neovim-unwrapped-master/share/nvim/runtime,/nix/store/r5ybaiyajgpzqys0fag0fnkfr0ark5kx-neovim-unwrapped-master/lib/nvim,/run/current-system/sw/share/nvim/site/after,/nix/var/nix/profiles/default/share/nvim/site/after,/etc/profiles/per-user/luca/share/nvim/site/after,~/.nix-profile/share/nvim/site/after,/nix/store/qh0hdh1zb513my7s48r3qp78lg8f97yb-desktops/share/nvim/site/after,/nix/store/m8i15rddjlp6lx6g2f60jz7s06ycazk1-patchelf-0.15.0/share/nvim/site/after,~/.local/share/nvim/site/after,/run/current-system/sw/etc/xdg/nvim/after,/nix/var/nix/profiles/default/etc/xdg/nvim/after,/etc/profiles/per-user/luca/etc/xdg/nvim/after,~/.nix-profile/etc/xdg/nvim/after,/etc/xdg/nvim/after,~/.config/nvim/after
set runtimepath=/nix/store/ihrj05j47h91ym4qmbl4m0w9n9p8ks2l-vim-pack-dir,/nix/store/ihrj05j47h91ym4qmbl4m0w9n9p8ks2l-vim-pack-dir/pack/*/start/*,~/.config/nvim,/etc/xdg/nvim,~/.nix-profile/etc/xdg/nvim,/etc/profiles/per-user/luca/etc/xdg/nvim,/nix/var/nix/profiles/default/etc/xdg/nvim,/run/current-system/sw/etc/xdg/nvim,~/.local/share/nvim/site,/nix/store/m8i15rddjlp6lx6g2f60jz7s06ycazk1-patchelf-0.15.0/share/nvim/site,/nix/store/qh0hdh1zb513my7s48r3qp78lg8f97yb-desktops/share/nvim/site,~/.nix-profile/share/nvim/site,/etc/profiles/per-user/luca/share/nvim/site,/nix/var/nix/profiles/default/share/nvim/site,/run/current-system/sw/share/nvim/site,/nix/store/r5ybaiyajgpzqys0fag0fnkfr0ark5kx-neovim-unwrapped-master/share/nvim/runtime,/nix/store/r5ybaiyajgpzqys0fag0fnkfr0ark5kx-neovim-unwrapped-master/share/nvim/runtime/pack/dist/opt/matchit,/nix/store/r5ybaiyajgpzqys0fag0fnkfr0ark5kx-neovim-unwrapped-master/lib/nvim,/nix/store/ihrj05j47h91ym4qmbl4m0w9n9p8ks2l-vim-pack-dir/pack/*/start/*/after,/run/current-system/sw/share/nvim/site/after,/nix/var/nix/profiles/default/share/nvim/site/after,/etc/profiles/per-user/luca/share/nvim/site/after,~/.nix-profile/share/nvim/site/after,/nix/store/qh0hdh1zb513my7s48r3qp78lg8f97yb-desktops/share/nvim/site/after,/nix/store/m8i15rddjlp6lx6g2f60jz7s06ycazk1-patchelf-0.15.0/share/nvim/site/after,~/.local/share/nvim/site/after,/run/current-system/sw/etc/xdg/nvim/after,/nix/var/nix/profiles/default/etc/xdg/nvim/after,/etc/profiles/per-user/luca/etc/xdg/nvim/after,~/.nix-profile/etc/xdg/nvim/after,/etc/xdg/nvim/after,~/.config/nvim/after,~/.config/treesitter_parsers
set scrolloff=5
set shiftwidth=2
set showtabline=2
set smartcase
set spelllang=en_us,de_de
set splitbelow
set splitright
set noswapfile
set tabline=%1@BufferlineMainClickHandler@%#BufferCurrentSign#▎\ \ \ \ %1@BufferlineMainClickHandler@%#DevIconDartCurrent#\ %1@BufferlineMainClickHandler@%#BufferCurrent#main.dart\ \ \ \ \ %1@BufferlineCloseClickHandler@%#BufferCurrent#\ %0@BufferlineMainClickHandler@%#BufferTabpageFill#▎%#BufferTabpageFill#
set tabstop=2
set termguicolors
set undodir=~/.vim/tmp/undo/
set undofile
set wildmode=longest,list,full
set window=49
set winheight=30
set winminheight=6
set winminwidth=17
set winwidth=83
" vim: set ft=vim :
