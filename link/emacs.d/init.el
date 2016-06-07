;; Set the built-in user-emacs-directory to the directory in which
;; this file is located
(setq user-emacs-directory
      (file-name-directory load-file-name))

;; Place all backup files in a "backup" directory, which is a sibling
;; of this file
(setq backup-directory-alist
      (list (cons "." (expand-file-name "backup" user-emacs-directory))))

;; Set up 'custom' system
(setq custom-file
      (expand-file-name "emacs-customizations.el" user-emacs-directory))
(load custom-file)

;; Load up functions (Can this be joined with 'custom' system?)
(setq function-file
      (expand-file-name "emacs-functions.el" user-emacs-directory))
(load function-file)

;; Set up Mac OS X specific hacks
(if (string-equal "darwin" (symbol-name system-type))
    (progn
      ;; A quick & ugly PATH solution to Emacs on Mac OSX
      (setenv "PATH" (concat "/opt/local/bin:/opt/local/sbin:"
			     (getenv "PATH")))))

;; Set up additonal key bindings
;; (global-set-key (kbd "M-SPC") 'anything)

;; Customize org-mode
(setq org-cycle-separator-lines 1)

;; Turn off the audible bell
(setq visible-bell 1)
