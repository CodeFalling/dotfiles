;; Install packages via el-get
(load "~/.emacs.d/init-el-get")

;; General setup
(require 'uniquify)
(setq tool-bar-mode nil
      uniquify-buffer-name-style (quote post-forward)
      indent-tabs-mode nil)
(global-auto-revert-mode)

;; Choose theme
(load-theme 'tango-dark t)

;; Setup for markdown
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
(add-hook 'markdown-mode-hook 'visual-line-mode)

;; Setup for ruby
(require 'ruby-tools)

;; Setup for HTML/XML/etc
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; Setup for TeX
(setq TeX-PDF-mode t)

;; Setup for ECB
(setq ecb-options-version "2.40")
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))

;; Setup for editing mail
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))
(add-hook 'mail-mode-hook 'visual-line-mode)

;; Setup for org-mode
(setq org-startup-indented t)
(setq org-startup-folded (quote content))

;; Setup for whitespace-mode
(setq whitespace-style
      (quote (face tabs spaces trailing lines space-before-tab
                   newline empty space-after-tab space-mark tab-mark
                   newline-mark)))

;; Load local settings
(load "init-local" t)

;; Machine-local customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)
