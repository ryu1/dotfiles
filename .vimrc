"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible

" 改行コードの自動認識
set fileformats=unix,dos,mac

" ビープ音を鳴らさない
set vb t_vb=

" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
"set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup

" バックアップをとる場合
set backup

" バックアップファイルを作るディレクトリ
set backupdir=~/.vim/vimbackup

" スワップファイルを作るディレクトリ
set directory=~/.vim/vimswap

" バックアップを作成しないファイル名のパターン。
set backupskip=/tmp/*,/private/tmp/*"

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを行う
set incsearch
" 検索を循環させない
set nowrapscan

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示する
set number
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set nolist
set list
" Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定す
" る。
"   eol:c
"     論理行の行末に表示する文字を指定します。省略された場合は何も表示されません。
"   tab:xy
"     タブ文字の最初の桁の文字と、次の桁以降に表示する文字の 2 文字を指定します。
"     これは例えば、”tab:^_” のように設定すると “^___” の様に表示されます。空
"     白文字を指定することも可能です。 省略した場合、”^I” が表示されます。この場
"     合、'tabstop' の値に関わらず 2 文字幅で表示されるので注意して下さい。
"   trail:c
"     行末の連続する空白文字を表示する文字を指定します。省略した場合、特に何も表示
"     されません。
"   extends:c
"     'wrap' がオフの時、行末に続くテキストがある場合にそのことを知らせるために行
"     末に表示される文字を指定します。
"   precedes:c
"     'wrap' がオフの時、行頭に続くテキストがある場合にそのことを知らせるために行
"     頭に表示される文字を指定します。
"   nbsp:c
"     non-breakable(改行不可) な空白文字(0xA0, 160) です。 一般的な空白文字 (0×20
"     32) ではないので注意して下さい。
"set listchars=tab:>-,extends:<,trail:-,eol:<
"set listchars=tab:>>,trail:-,nbsp:%,extends:>,precedes:<,eol:,
set listchars=tab:▸\ ,eol:¬

" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu
" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
" カレント行をハイライトする
set cursorline
highlight cursorline term=reverse cterm=reverse
" カーソル位置をウィンドウの中心に保ってスクロールする
set scrolloff=1000

"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
set noautoindent

" 改行時に前の行のインデントを継続する
" set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減
" set smartindent

" 他の2つの方法よりも賢く動作し、設定することで異なるインデントスタイルにも対応できる。
" set cindent


" タブが対応する空白の数
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するとき、代わりに空白を使わない
"set noexpandtab
set expandtab
" タブの視覚化
highlight TagKey guibg=#b5d68f
match TagKey /	/

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8

"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

"----------------------------------------------------
" カーソル移動
"----------------------------------------------------
"左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]
nnoremap h <Left>
nnoremap l <Right>

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block


"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------
" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" 括弧を自動補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
" autocmd BufWritePre * :%s/\t/  /ge


"----------------------------------------------------
" その他
"----------------------------------------------------
" helpを日本語優先に
set helplang=ja

" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボードをWindowsと連携
set clipboard+=unnamedplus,unnamed

"モード表示
set showmode

let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

"call pathogen#runtime_append_all_bundles()

"----------------------------------------------------
" NeoBundle
" $ mkdir ~/.vim/bundle
" $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"----------------------------------------------------

" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
  colorscheme desert
  " その他の処理
endfunction


" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
  " 読み込むプラグインの指定
  NeoBundle 'Shougo/neobundle.vim'
  "NeoBundle 'tpope/vim-surround'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimfiler.vim'

  " NERDTreeを設定(コマンドモードで :NERDTree)
  NeoBundle 'scrooloose/nerdtree'
  " ファイル指定で開かれた場合はNERDTreeは表示しない
  if !argc()
    autocmd vimenter * NERDTree|normal gg3j
  endif
  " F2で右にファイラ画面を表示したり閉じたりするなど
  " nnoremap <f2> :NERDTreeToggle<CR>
  " 最後に残ったウィンドウがNERDTREEのみのときはvimを閉じる
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " autoclose (bug: delete indent on newline)
  NeoBundle 'Townk/vim-autoclose'

  " Emmet
  NeoBundle 'mattn/emmet-vim'

  " quickrun
  NeoBundle 'thinca/vim-quickrun'

  " grep.vim
  NeoBundle 'grep.vim'

  " ...
  " JavaScript関連
  " ...
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'moll/vim-node'
  NeoBundle 'mattn/jscomplete-vim'
  NeoBundle 'myhere/vim-nodejs-complete'
  NeoBundle 'kchmck/vim-coffee-script.git'

  autocmd FileType javascript :setl omnifunc=jscomplete#CompleteJS

  " javascript code look good thanks a very nice syntax-aware highlighting.
  NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

  " to check the syntax for all languages
  NeoBundle 'scrooloose/syntastic'
"  let g:syntastic_mode_map={ 'mode': 'passive',
"                        \ 'active_filetypes': ['javascript', 'json'],
"                        \ 'passive_filetypes': ['javascript']
"                        \}
  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=2
  let g:syntastic_loc_list_height=6
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'

  "ファイルオープン時にはチェックをしない
  let g:syntastic_check_on_open=0
  "ファイル保存時にはチェックを実施
  let g:syntastic_check_on_save=1
  " JavaScriptのSyntaxチェックはjshint(npm install -g jshint)
  let g:syntastic_javascript_checkers = ['jshint']

  " ドキュメントジェネレータ
  NeoBundle 'heavenshell/vim-jsdoc'

  " node 用の辞書を追加します。C-x C-k で補完できます。
  NeoBundle 'guileen/vim-node-dict'
  au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node-dict/dict/node.dict

  NeoBundle 'felixge/vim-nodejs-errorformat'

  autocmd filetype coffee,javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
  " ...
  " 読み込んだプラグインの設定
  " ...
endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#begin(expand('~/.vim/bundle'))
      call s:LoadBundles()
      call neobundle#end()
    catch
      call s:WithoutBundles()
    endtry
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax on
endfunction

call s:InitNeoBundle()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" splitしたときファイル・タイプを認識しないので。
" filetype detect
autocmd BufRead,BufNewFile * filetype detect

" Start dein Scripts-------------------------
if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}


" Airline
" brew install ricty --with-powerline
" 2016/08/05

set laststatus=2
set showtabline=2 " 常にタブラインを表示
set t_Co=256 " この設定がないと色が正しく表示されない
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='papercolor' "落ち着いた色調が好き
let g:airline_powerline_fonts = 1

"let g:airline_section_a = airline#section#create(['mode',' ','branch'])
"let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
"let g:airline_section_c = airline#section#create(['filetype'])
"let g:airline_section_x = airline#section#create(['%P'])
"let g:airline_section_y = airline#section#create(['%B'])
"let g:airline_section_z = airline#section#create_right(['%l','%c'])

"End dein Scripts------------------------

" MacVim
if has('gui_macvim')
    set transparency=1
    set showtabline=2
    set imdisable
    set antialias
    set columns=200
    set lines=80
    set guioptions-=T
    set nobackup
    set guifont=Ricty\ Discord\ Regular\ for\ Powerline:h14

    colorscheme papercolor
endif
