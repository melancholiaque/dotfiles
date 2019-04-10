(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package emacs
  :init
  (setq backup-directory-alist
        `(("." . ,(concat user-emacs-directory "backups"))))
  :config
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (show-paren-mode 1)
  (global-eldoc-mode 1)
  (add-to-list 'default-frame-alist '(height . 24))
  (add-to-list 'default-frame-alist '(width . 80))
  (global-prettify-symbols-mode 1)) ;TODO

(use-package dired-x
  :config
  (progn
    (setq-default dired-omit-files-p t)
    (add-hook 'dired-mode-hook #'dired-hide-details-mode)
    (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))))

(use-package ivy
  :init
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(use-package swiper
  :bind
  (("C-s" . swiper)))

(use-package counsel
  :bind
  (("C-x C-f" . counsel-find-file)
   ("<f2> u" . counsel-unicode-char)))

(use-package company
  :config
  (global-company-mode))

(use-package smex
  :config
  (smex-initialize)
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)))

(use-package dashboard
  :init
  (setq dashboard-startup-banner "~/.emacs.d/lain.gif")
  (setq dashboard-banner-logo-title "present day, present time")
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package beacon
  :config
  (beacon-mode 1))

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t)
  :config
  (sml/setup))

(use-package elpy
  :init
  (setq sml/no-confirm-load-theme t)
  :config
  (elpy-enable))

;;; Language-specific

(use-package haskell-mode
  :hook haskell-indent-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#e7bec3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "PfEd" :family "Ubuntu Mono"))))
 '(highlight ((t (:background "#BC7881" :foreground "#000000"))))
 '(mode-line ((t (:background "#BC7881" :foreground "#000000" :box (:line-width -1 :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground "#000000" :weight bold))))
 '(mode-line-inactive ((t (:background "#BC7881" :foreground "#000000" :box (:line-width -1 :style released-button)))))
 '(sml/modified ((t (:inherit sml/not-modified :foreground "Black" :weight bold)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (xresources)))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "86704574d397606ee1433af037c46611fb0a2787e8b6fd1d6c96361575be72d2" default)))
 '(dired-use-ls-dired nil)
 '(package-selected-packages
   (quote
    (intero hlint-refactor company-ghc haskell-mode company rainbow-mode smart-mode-line web-mode all-the-icons-dired all-the-icons-ivy parinfer flycheck beacon undo-tree smex dashboard geiser xresources-theme use-package swiper-helm quelpa elpy ein counsel))))
