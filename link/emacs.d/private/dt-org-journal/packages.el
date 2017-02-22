(setq dt-org-journal-packages '(org-journal))

(defun dt-org-journal/init-org-journal()
  (use-package org-journal
    :init
    (setq org-journal-find-file #'find-file)
    (setq org-journal-dir "~/org/journal")
    (setq org-journal-date-format "%A, %Y-%m-%d")
    (setq org-journal-file-format "%Y-%m-%d.org")
    :config
    (progn
      (add-to-list 'auto-mode-alist '(".*/[0-9]*$" . org-mode)))))
