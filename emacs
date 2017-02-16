(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Auto install packages on start - slow but I'm lazy
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))
(use-package paredit
             :ensure t)
(dolist (package '(markdown-mode helm git-gutter spacegray-theme evil-visual-mark-mode))
  (unless (package-installed-p package)
    (package-install package))
  (require package))

;; setup
; (setq package-enable-at-startup nil)
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
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:modified-sign "~")
 '(org-agenda-files (quote ("/Volumes/Home/Dropbox/org/life.org")))
 '(package-selected-packages
   (quote
    (markdown-mode helm git-gutter spacegray-theme evil-visual-mark-mode)))
 '(word-wrap t))
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
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; Set the location of Org files on your local system
(setq org-directory "/Volumes/Home/Dropbox/org")

;; calendar export for org
(setq org-icalendar-combined-agenda-file "/Volumes/Home/Dropbox/org/org.ics")
(setq org-icalendar-include-todo '(all))
(setq org-icalendar-use-scheduled '(event-if-todo event-if-not-todo))
(setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo))

;; this hook saves an ics file once an org-buffer is saved
(defun my-icalendar-agenda-export()
  (if (string= (file-name-extension (buffer-file-name)) "org")
    (org-icalendar-combine-agenda-files))
  )
(add-hook 'after-save-hook 'my-icalendar-agenda-export)

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("DOING" :foreground "orange" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "yellow" :weight bold)
              ("SOMEDAY" :foreground "sky blue" :weight bold))))

;; Indent the stars in org
(org-indent-mode 1)

;; scroll 2 lines with scroll (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 2) ;; keyboard scroll one line at a time

;; spacing
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Word wrap
(setq line-move-visual nil)

;; Disable backups
(setq make-backup-files nil)

;; Hide gui
; (menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; word wrap
(visual-line-mode t)

;; Change line spacing slightly
(setq line-spacing '0.10)

;; start maximised
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Relative numbers
(require 'nlinum-relative)
;; setup for evil
(nlinum-relative-setup-evil)
(nlinum-mode)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
;; delay sucks
(setq nlinum-relative-redisplay-delay 0)
;; "" shows current line number
(setq nlinum-relative-current-symbol "")
(setq nlinum-relative-offset 0)

;;; esc always quits. Sometimes, here and there, or just use Ctrl-g
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-map (kbd "ESC") 'keyboard-escape-quit)
(define-key query-replace-map (kbd "<escape>") 'keyboard-quit)

;; Ctrl-h to delete when in insert mode
(define-key evil-insert-state-map "\C-h" 'evil-delete-backward-char)

;; Git gutter
(global-git-gutter-mode +1)
;; can change background color too
(set-face-foreground 'git-gutter:modified "yellow")
(set-face-foreground 'git-gutter:added "forest green")
(set-face-foreground 'git-gutter:deleted "tomato")

;; helm
;; Files in buffer
(global-set-key (kbd "C-c b") 'helm-mini)
;; Show files in directory
(global-set-key (kbd "C-c f") 'helm-find-files)
(global-set-key (kbd "M-x") #'helm-M-x)

