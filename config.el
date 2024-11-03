;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nick Boffi"
      user-mail-address "nboffi@andrew.cmu.edu")

(setq doom-theme 'doom-one)

(setq display-line-numbers-type t)

(after! org
  (setq org-roam-directory "~/Dropbox/org/roam/")
  (setq org-roam-index-file "~/Dropbox/org/roam/index.org")

  ;; Use dvisvgm for better quality and scaling
  (setq org-preview-latex-default-process 'dvisvgm)

  ;; Set a good default size (adjust as needed)
  (plist-put org-format-latex-options :scale 5.0)

  ;; Improve resolution for better scaling
  (plist-put org-format-latex-options :dpi 300))

;; better autocompletion for latex
(use-package! company-auctex
  :after company
  :config
  (company-auctex-init)
  (add-to-list 'company-backends 'company-yasnippet))

;; Add LaTeX autocompletion setup
;; thanks to claude for help with the below configs for latex + org-mode
(use-package! company-auctex
  :after (company latex)
  :config
  (add-to-list 'company-backends 'company-auctex-macros)
  (add-to-list 'company-backends 'company-auctex-symbols)
  (add-to-list 'company-backends 'company-auctex-environments))

(after! org
  (add-hook! 'org-mode-hook
    (setq-local company-backends
                (append '(company-auctex-macros
                          company-auctex-symbols
                          company-auctex-environments)
                        company-backends))))

;; Add CDLaTeX support for Org mode
(use-package! cdlatex
  :hook (org-mode . turn-on-org-cdlatex)
  :config
  (after! cdlatex
    (setq cdlatex-env-alist
          (append '(("aligned" "\\begin{equation}\n\\begin{aligned}?\n\\end{aligned}\n\\end{equation}\n" nil)
                    ("equation*" "\\begin{equation\*}\n?\n\\end{equation\*}\n" nil)
                    ("aligned*" "\\begin{equation\*}\n\\begin{aligned}?\n\\end{aligned}\n\\end{equation\*}\n" nil))
                  (or cdlatex-env-alist '())))))


;; set up org-roam-ui
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; turn off prettify
(global-prettify-symbols-mode -1)
(setq tex-fontify-script nil)

;; maybe help with multi-file latex documents
(setq-default TeX-master "main")

;; always check refs.bib in the current directory with reftex
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq reftex-default-bibliography
                  (list (concat default-directory "refs.bib")
                        (concat default-directory "paper.bib")))))
;; auto-load pdfs when using latex
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

;; allow black formatting remote with apheleia
(setq apheleia-remote-algorithm 'local)

;; turn of type checking; doesnt work well with jax and ml_collections
(after! lsp-mode
  (setq lsp-pyright-typechecking-mode "off"))

;; manually set org agenda files
(after! org
  (setq org-agenda-files    '("/Users/boffi/Dropbox/org/roam/20240404093526-urgent.org"
                              "~/Dropbox/org/roam/20240404093723-vicsek.org"
                              "/Users/boffi/Dropbox/org/roam/20240404093850-interpolants.org"
                              "/Users/boffi/Dropbox/org/roam/mips.org"
                              "/Users/boffi/Dropbox/org/roam/general.org"
                              "/Users/boffi/Dropbox/org/roam/20240404092307-emails.org"
                              "/Users/boffi/Dropbox/org/roam/20240404094056-slacks.org"
                              "/Users/boffi/Dropbox/org/roam/teaching.org"
                              "/Users/boffi/Dropbox/org/roam/20240404093630-personal.org"
                              "/Users/boffi/Dropbox/org/roam/chores.org"
                              "/Users/boffi/Dropbox/org/roam/investing.org"
                              "/Users/boffi/Dropbox/org/roam/budget.org"
                              "/Users/boffi/Dropbox/org/roam/emacs.org"
                              "/Users/boffi/Dropbox/org/roam/pkm.org"
                              "/Users/boffi/Dropbox/org/roam/generative_modeling_structure.org")))

;; thanks to claude for the below configs to help with latex rendering
;; and with a custom style file that includes relevant commands
(setq org-latex-compiler-file-string
      "\\makeatletter\\def\\input@path{{~/.doom.d/}}\\makeatother")

(setenv "TEXINPUTS" (concat (getenv "TEXINPUTS") ":~/.doom.d//"))

(setq org-latex-packages-alist
      '(("" "amsmath" t)
        ("" "amssymb" t)
        ("" "latex_commands" t)))

;; good org latex preview behavior (thanks claude!)
;; Render LaTeX previews by default when opening a file
(setq org-startup-with-latex-preview t)
(setq org-latex-preview-auto t)
(setq org-latex-preview-eager t)

;; automatically toggle latex preview
(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode))
(setq org-fragtog-preview-delay 0.01)  ; Default is 0.2 seconds

;; updated performance
;; garbage collection
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; LSP performance
(after! lsp-mode
  (setq lsp-idle-delay 0.5
        lsp-log-io nil))


;; save place in files
(save-place-mode 1)

;; recent files
(recentf-mode 1)
(setq recentf-max-saved-items 50)
