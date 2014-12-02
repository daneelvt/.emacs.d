;; http://lorefnon.me/2014/02/02/configuring-emacs-for-rails.html
;; https://github.com/sellout/emacs-color-theme-solarized
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
;; http://company-mode.github.io/
;; https://github.com/Fanael/rainbow-delimiters
;; http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/
;; https://github.com/Fuco1/smartparens
;; http://www.emacswiki.org/emacs/CompiledFile
;; https://github.com/skeeto/.emacs.d
;; https://github.com/jonathanchu/emacs-powerline
;; https://github.com/terhechte/emacs.d/blob/master/init.el


;; Default load paths
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; require package and repositories
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; list of packages to install
(defvar my-packages '(better-defaults
		      color-theme-solarized
                      projectile
                      flx-ido
                      company
                      rainbow-delimiters
                      highlight-indentation
                      rainbow-identifiers
		      clojure-mode
		      cider
                      paredit))

;; install packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; load theme
(load-theme 'solarized-dark t)


;; Set windnow initial width and height
(setq default-frame-alist
      '(
        (width . 100) ; character
        (height . 32) ; lines
        ))


(set-face-attribute 'default nil :height 130 :font "Courier New")


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(setq show-paren-delay 0)
(show-paren-mode 1)

(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

;; make parentheses smart (manually install smartparens)
(require 'smartparens)
(require 'smartparens-config)
(require 'smartparens-html)
(smartparens-global-mode)
;;(show-smartparens-global-mode t)


(require 'paxedit)
(add-hook 'emacs-lisp-mode-hook 'paxedit-mode)
(add-hook 'clojure-mode-hook 'paxedit-mode)

(eval-after-load "paxedit"
  '(progn (define-key paxedit-mode-map (kbd "<M-right>") 'paxedit-transpose-forward)
          (define-key paxedit-mode-map (kbd "<M-left>") 'paxedit-transpose-backward)
          (define-key paxedit-mode-map (kbd "<M-up>") 'paxedit-backward-up)
          (define-key paxedit-mode-map (kbd "<M-down>") 'paxedit-backward-end)
          (define-key paxedit-mode-map (kbd "M-b") 'paxedit-previous-symbol)
          (define-key paxedit-mode-map (kbd "M-f") 'paxedit-next-symbol)
          (define-key paxedit-mode-map (kbd "C-%") 'paxedit-copy)
          (define-key paxedit-mode-map (kbd "C-&") 'paxedit-kill)
          (define-key paxedit-mode-map (kbd "C-*") 'paxedit-delete)
          (define-key paxedit-mode-map (kbd "C-^") 'paxedit-sexp-raise)
          (define-key paxedit-mode-map (kbd "M-u") 'paxedit-symbol-change-case)
          (define-key paxedit-mode-map (kbd "C-@") 'paxedit-symbol-copy)
          (define-key paxedit-mode-map (kbd "C-#") 'paxedit-symbol-kill)))

;; ido support
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Change emacs GC from every 0.76 MB to every 20 MB
(setq gc-cons-threshold 20000000)


(add-hook 'after-init-hook 'global-company-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
