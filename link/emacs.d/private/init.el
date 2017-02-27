;; Set the built-in user-emacs-directory to the directory in which
;; this file is located
(setq user-emacs-directory
      (file-name-directory load-file-name))

;; Load up functions
(setq function-file
      (expand-file-name "emacs-functions.el" user-emacs-directory))
(load function-file)

;; Customize org-mode
(setq org-cycle-separator-lines 1)

;; Turn off the audible bell
(setq visible-bell 1)
