(require 's)

(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 1024)
(setq initial-scratch-message "")
(setq safe-local-variable-values '((org-confirm-elisp-link-function . nil)))
(setq find-function-C-source-directory (concat user-emacs-directory "emacs-24.3/src"))
(setq delete-old-versions t)
(setq browse-url-browser-function 'browse-url-xdg-open)
(fset 'yes-or-no-p 'y-or-n-p)
(setq split-height-threshold 0
      split-width-threshold 0)
(line-number-mode t)
(column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq uniquify-buffer-name-style 'forward)
(require 'uniquify)
(setq apropos-do-all t)
(setq recentf-save-file (concat user-emacs-directory "etc/recentf")
      recentf-max-menu-items 25
      recentf-max-saved-items 50)
(recentf-mode t)
(setq savehist-file (concat user-emacs-directory "etc/savehist")
      history-length 150)
(savehist-mode t)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "etc/saveplace"))
(require 'saveplace)
(setq async-shell-command-buffer 'new-buffer)
(setq server-use-tcp t)
(setq mouse-yank-at-point t)
(setq comint-prompt-read-only t)
(setq scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(setq frame-title-format '("" invocation-name ": " (:eval (s-trim (buffer-name)))))
(setq user-directory (concat "/home/" user-login-name "/"))
(setq blink-matching-paren nil)
;; primitive vcs and uncluttering
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory "backup"))))
(setq auto-save-list-file-prefix (concat user-emacs-directory "autosave/"))
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "autosave/\\1") t)))
(setq version-control t)
(winner-mode t)
(setq windmove-wrap-around t)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "etc/saved-places"))
(setq python-check-command "flake8")
(unicode-whitespace-setup)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq bookmark-default-file (concat user-emacs-directory "etc/bookmarks"))
(setq tumblesocks-token-file (concat user-emacs-directory "etc/tumblr-oauth-token"))
(defun my-quit-help ()
  (interactive)
  (when (equal major-mode 'help-mode)
    (kill-buffer)
    (when (> (length (window-list)) 1)
      (delete-window))))
(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-split-window-function 'split-window-horizontally)
(setq quelpa-upgrade-p t)

(setq csv-separators '(";" "	" ",")
      csv-separator-chars '(?\; ?	 ?,)
      csv--skip-regexp "^
;	,"
      csv-separator-regexp "[;	,]"
      csv-font-lock-keywords '(("[;	,]" (0 'csv-separator-face))))

(defun my-startup-greeter ()
  (message "Let the hacking begin!"))
(defalias 'display-startup-echo-area-message 'my-startup-greeter)

(add-hook 'eshell-load-hook 'nyan-prompt-enable)

(provide 'setup-annoyances)
