(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacegray)))
 '(custom-safe-themes
   (quote
    ("d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" default)))
 '(org-agenda-files (quote ("/Volumes/Home/Dropbox/org/life.org")))
 '(package-selected-packages (quote (spacegray-theme evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'evil)
(evil-mode t)

;; Hide the stupid startupscreen
(setq inhibit-splash-screen t)

;; org mode
(require 'org)
;; Start org mode file on load
(find-file "/Volumes/Home/Dropbox/org/life.org")
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; Set to the location of your Org files on your local system
(setq org-directory "/Volumes/Home/Dropbox/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "/Volumes/Home/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "/Volumes/Home/Dropbox/Apps/MobileOrg")

;; spacing
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Word wrap
(setq line-move-visual nil)

;; Disable backups
(setq make-backup-files nil)

;; Hide gui
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; start maximised
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

