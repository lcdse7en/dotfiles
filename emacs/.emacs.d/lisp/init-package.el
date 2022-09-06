;; 启动耗时
(use-package benchmark-init
             :init (benchmark-init/activate)
             :hook (after-init . benchmark-init/deactivate))

(use-package crux
             :bind ("C-k" . crux-smart-kill-line))

(use-package hungry-delete
             :bind (("C-c DEL" . hungry-delete-backward))
             :bind (("C-c d" . hungry-delete-forward)))


(use-package drag-stuff
             :bind (("<M-up>" . drag-stuff-up)
                    ("<M-down>" . drag-stuff-down)))

;; 搜索
(use-package ivy
             :defer 1
             :demand
             :hook (after-init . ivy-mode)
             :config
             (ivy-mode 1)
             (setq ivy-use-virtual-buffers t
                   ivy-initial-inputs-alist nil
                   ivy-count-format "%d%d "
                   enable-recursive-minibuffers t
                   ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
             :after (ivy)
             :bind (("M-x" . counsel-M-x)
                    ("C-x C-f" . counsel-find-file)
                    ("C-c f" . counsel-recentf)
                    ("C-c g" . counsel-git)))

(use-package swiper
             :after ivy
             :bind (("C-s" . swiper)
                    ("C-r" . swiper-isearch-backward))
             :config (setq swiper-action-recenter t
                           swiper-include-line-number-in-search t))

;; 自动补全
(use-package company
             :config
             (setq company-dabbrev-code-everywhere t
                   company-dabbrev-code-mode t
                   company-dabbrev-code-other-buffers 'all
                   company-dabbrev-downcase nil
                   company-dabbrev-ignore-case t
                   company-dabbrev-other-buffers 'all
                   company-require-match nil
                   company-niminum-prefix-length 2
                   company-show-numbers t
                   company-tooltip-limit 20
                   company-idle-delay 0
                   company-echo-delay 0
                   company-tooltip-offset-display 'scrollbar
                   company-begin-commands '(self-insert-command))
             (push '(company-semantic :with company-yasnippet) company-backends)
             :hook ((after-init . global-company-mode)))

;; 语法检查
(use-package flycheck
             :hook (prog-mode . flycheck-mode))

;; which-key
(use-package which-key
             :defer nil
             :diminish
             :init (which-key-mode))

(use-package ivy-posframe)
;; Different command can use different display function.
(setq ivy-posframe-display-functions-alist
      '((swiper          . ivy-posframe-display-at-frame-center)
        (complete-symbol . ivy-posframe-display-at-point)
        (counsel-M-x     . ivy-posframe-display-at-frame-center)
        (ivy-switch-buffer     . ivy-posframe-display-at-frame-center)
        (counsel-find-file     . ivy-posframe-display-at-frame-center)
        (t               . ivy-posframe-display)))
(ivy-posframe-mode 1)

;; ctrlf, good isearch alternative
(use-package ctrlf
  :hook (after-init . ctrlf-mode))


;; Org Mode
(setq org-hide-leading-stars t
      org-startup-indented t)

;; Parentheses
(use-package paren
  :ensure nil
  :config (setq-default show-paren-style 'mixed
                        show-paren-when-point-inside-paren t
                        show-paren-when-point-in-periphery t)
  :hook (prog-mode . show-paren-mode))

;; Recent Files
(add-hook 'after-init-hook (lambda ()
			     (recentf-mode 1)
			     (add-to-list 'recentf-exclude '("~\/.emacs.d\/elpa\/"))))
(setq-default recentf-max-menu-items 20
	      recentf-max-saved-items 20)

;; ibuffer
(use-package ibuffer
  :init (defalias 'list-buffers 'ibuffer))

;; Ido ( instead of ivy & counsel & swiper)
(setq-default ido-auto-merge-work-directories-length -1
	      ido-enable-flex-matching t
	      isearch-lazy-count t
	      lazy-count-prefix-format "%s/%s: ")
(setq completion-ignored-extensions '(".o" ".elc" "~" ".bin" ".bak" ".obj" ".map" ".a" ".ln" ".class"))
(fido-mode t)

;; auto revert
;; `global-auto-revert-mode' is provided by autorevert.el (builtin)
(use-package autorevert
  :hook (after-init . global-auto-revert-mode))

;; Delete Behavior
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'after-init-hook 'delete-selection-mode)

;; Electric-Pair
(add-hook 'after-init-hook 'electric-indent-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'electric-layout-mode)

;; Flymake
(add-hook 'prog-mode-hook 'flymake-mode)

;; HideShow Minor Mode
(use-package hideshow
  :init (add-hook 'hs-minor-mode-hook (lambda () (diminish 'hs-minor-mode)))
  :hook (prog-mode . hs-minor-mode))

;; auto save
;; `save-some-buffers' is provided by files.el (builtin)
;; `pulse-momentary-highlight-one-line' is provided by pulse.el (builtin)
(use-package pulse-and-save
  :ensure nil
  :init
  (defun pulse-save-buffers (&rest args)
    (save-some-buffers t)
    (pulse-momentary-highlight-one-line (point)))
  ;; auto save when frame lose focus, Alt-Tab
  (add-function :after after-focus-change-function #'pulse-save-buffers)
  ;; auto save when buffer changed
  (dolist (command '(other-window
                     switch-to-buffer
                     next-buffer
                     previous-buffer))
    (advice-add command :after #'pulse-save-buffers)))

;; LSP
(use-package lsp-mode
             ;; :hook ((prog-mode . (lsp-deferred))
             :hook ((lsp-mode . lsp-enable-which-key-integration)
                    (python-mode . lsp-deferred)
                    (html-mode . lsp-deferred)
                    (go-mode . lsp-deferred)
                    (js-mode . lsp-deferred)
                    (c-mode . lsp-deferred)
                    (web-mode . lsp-deferred))
             :commands (lsp lsp-deferred)
             :init (setq lsp-prefer-flymake nil
                         lsp-keep-workspace-alive nil
                         lsp-enable-indentation nil
                         lsp-enable-on-type-formatting nil
                         lsp-auto-guess-root nil
                         lsp-enable-snippet t)
             :config
             (use-package lsp-clients
                          :ensure nil
                          :functions (lsp-format-buffer  lsp-organize-imports)))

;; 分屏之间跳转
(use-package ace-window
             :bind (("M-o" . 'ace-window)))

(use-package crux
             :bind (("C-a" . crux-move-beginning-of-line)
                    ("C-c ^" . crux-top-join-line)
                    ("C-x ," . crux-find-user-init-file)
                    ("C-S-d" . crux-duplicate-current-line-or-region)
                    ("C-S-k" . crux-smart-kill-line)))

(use-package restart-emacs)


(provide 'init-package)
