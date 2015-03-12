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


;; Set up Mac OS X specific hacks
(if (string-equal "darwin" (symbol-name system-type))
    (progn
      ;; Set up key binding for full-screen toggling
      (global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
      ;; A quick & ugly PATH solution to Emacs on Mac OSX
      (setenv "PATH" (concat "/opt/local/bin:/opt/local/sbin:"
			     (getenv "PATH")))))

;; Pick a theme
(load-theme 'wombat)

;; Set up additonal key bindings
(global-set-key (kbd "M-SPC") 'anything)
