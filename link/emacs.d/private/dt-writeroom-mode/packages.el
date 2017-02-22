;;; packages.el --- dt-writeroom-mode layer packages file for Spacemacs.
(setq dt-writeroom-mode-packages
      '(writeroom-mode))

(defun dt-writeroom-mode/init-writeroom-mode ()
  (use-package writeroom-mode
    :commands (writeroom-mode)
    :init
    (evil-leader/set-key "Tw" 'writeroom-mode)
    :config
    (setq writeroom-restore-window-config t)))
