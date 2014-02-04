(helm-mode t)
(setq helm-ff-ido-style-backspace 'always
      helm-ff-auto-update-initial-value t
      helm-ff-newfile-prompt-p nil
      helm-ff-skip-boring-files t)
(setq helm-adaptive-history-file (concat user-emacs-directory "etc/helm-adaptive")
      helm-adaptive-history-length 100)
(helm-adaptative-mode t)
(setq helm-mp-highlight-delay 0.3)

(setq helm-cmd-t-default-repo (concat user-directory "code/dotfiles"))

;; helm ack-grep hacks
(setq helm-ack-grep-executable "ag")
(setq helm-grep-default-command
      (concat helm-ack-grep-executable " --nogroup --nocolor --nopager --smart-case -z %p %f")
      helm-grep-default-recurse-command
      (concat helm-ack-grep-executable " --nogroup --nocolor --nopager --smart-case -z %p %f"))

;; helm grep hacks
(when helm-ff-ido-style-backspace
  (define-key helm-read-file-map (kbd "<backspace>")
    'helm-find-files-down-one-level))

;; helm completing read functions
(setq helm-completing-read-handlers-alist
      '((describe-function . helm-completing-read-symbols)
        (describe-variable . helm-completing-read-symbols)
        (debug-on-entry . helm-completing-read-symbols)
        (find-function . helm-completing-read-symbols)
        (find-tag . helm-completing-read-with-cands-in-buffer)
        (find-library . helm-completing-read-with-cands-in-buffer)
        (ffap-alternate-file)
        (tmm-menubar)))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "<f10>") 'helm-resume)

(provide 'wasa-helm)
