;;; init.el -*- lexical-bindinguc: t; -*-

(doom! :completion
       (company +childframe) ; the ultimate code completion backend
       vertico               ; the search engine of the future

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides     ; highlighted indent columns
       ligatures         ; ligatures and symbols to make your code pretty again
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink cursor line after big motions
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitablekkkkkorary windows
       treemacs          ; a project drawer, like neotree but cooler
       unicode           ; extended unicode support for various languages
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       (snippets +everywhere); my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       ibuffer           ; interactive buffer management
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       (spell +flyspell) ; tasing you for misspelling mispelling
       grammar           ; tasing grammar mistake every you make

       :tools
       biblio            ; Writes a PhD for you (citation needed)
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       lsp                 ; M-x vscode
       magit               ; a git porcelain for Emacs
       make                ; run make tasks from Emacs
       (pdf +latex)        ; pdf enhancements
       tmux              ; an API for interacting with tmux
       tree-sitter         ; syntax and parsing, sitting in a tree...

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS

       :lang
       (cc +lsp)         ; C > C++ == 1
       emacs-lisp          ; drown in parentheses
       (latex +lsp +latexmk +cdlatex) ; writing papers in Emacs has never been so fun
       markdown          ; writing docs for people to ignore
       (org +roam2 +pretty +dragndrop) ; organize your plain life in plain text
       (python +lsp +conda +pyright)            ; beautiful is better than ugly
       sh                ; she sells {ba,z,fi}sh shells on the C xor

       :email
       mu4e +org +gmail

       :config
       (default +bindings +smartparens))
