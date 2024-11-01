;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Nick Boffi"
      user-mail-address "boffi@cims.nyu.edu")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;(use-package! org-roam
;;  :custom
;;  (org-roam-directory "~/Dropbox/org/roam")
;;  :config
;;  (org-roam-setup))

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
(after! company
  (add-to-list 'company-backends 'company-auctex)
  (add-to-list 'company-backends 'company-yasnippet))

(use-package! company-auctex
  :after company
  :config
  (company-auctex-init))

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
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
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

;; fix display or org-roam with org-agenda
(setq org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                 (todo . " %i %-12:c")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))


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
                                        ;                              "/Users/boffi/Dropbox/org/roam/20240404091936-reading.org"
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


;; set jax python
;; (after! lsp-pyright
;;   (setq lsp-pyright-python-executable-cmd "/Users/boffi/mambaforge/envs/jax/bin/python"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
