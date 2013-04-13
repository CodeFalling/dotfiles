(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(custom-safe-themes (quote ("d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(ecb-options-version "2.40")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set up package.el
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Set up el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-sources
      '(
        (:name ecb
	       :description "Emacs Code Browser"
	       :type github
	       :pkgname "alexott/ecb"
	       ;:depends cedet
	       :build `(("make" "CEDET=../cedet" ,(concat "EMACS=" (shell-quote-argument el-get-emacs)))))
	(:name pandoc-mode
	       :type github
	       :description "Emacs mode for interacting with Pandoc."
	       :pkgname "joostkremers/pandoc-mode")))
(setq my-packages
  (append
      '(el-get
	;ecb
	ack
	markdown-mode
	pandoc-mode
	auctex
	magit
	zenburn-theme
	)
      (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)

;; Setup theme
(load-theme 'tango-dark t)

;; Setup markdown-mode
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
