;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; set up org-roam-ui
(package! org-roam-ui)

;; copilot for emacs
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))

;; auto-render latex
(package! org-fragtog)

;; org super agenda
(package! org-super-agenda)
