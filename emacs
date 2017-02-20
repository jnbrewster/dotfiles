(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-enabled-themes (quote (base16-eighties)))
 '(custom-safe-themes
   (quote
    ("3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "21b6f06754acc3ea0bf1c325f373595cc824b641672bd944c9e66feb10a08da7" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" default)))
 '(fci-rule-color "#343d46")
 '(org-agenda-default-appointment-duration nil)
 '(org-agenda-files (quote ("/Volumes/Home/Dropbox/org/life.org")))
 '(package-selected-packages
   (quote
    (web-mode exec-path-from-shell paredit use-package company ## magit nlinum-relative org-bullets whitespace-cleanup-mode flycheck base16-theme markdown-mode helm evil-visual-mark-mode)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'evil)
(evil-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package installer on load
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))
(use-package paredit
  :ensure t)
(dolist (package '(web-mode exec-path-from-shell paredit use-package company ## magit nlinum-relative org-bullets whitespace-cleanup-mode flycheck base16-theme markdown-mode helm evil-visual-mark-mode))
  (unless (package-installed-p package)
    (package-install package))
  (require package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hide the stupid startupscreen
(setq inhibit-splash-screen t)
                                        ; Set font
(set-frame-font "SF Mono 12")
;; scroll 2 lines with scroll (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 2)
;; spacing
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
;; Word wrap
(global-visual-line-mode t)
;; Disable backups
(setq make-backup-files nil)
;; Hide gui crap
;; (menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;; word wrap
(visual-line-mode t)
;; Hide emphasis markers
(setq org-hide-emphasis-markers t)
;; Set size of inline images to 100
(setq org-image-actual-width '(100))
;; Change line spacing slightly
(setq line-spacing '0.10)
;; start maximised
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Relative numbers
(require 'nlinum-relative)
;; setup for evil
(nlinum-relative-setup-evil)
;; setup relative lines
(nlinum-mode)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
;; delay sucks
(setq nlinum-relative-redisplay-delay 0)
;; "" shows current line number
(setq nlinum-relative-current-symbol "")
(setq nlinum-relative-offset 0)
;; Change nlinum padding around numbers
(global-nlinum-mode 1)
(setq nlinum-format " %d ")
;; flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))
;; clean whitespace on save
(use-package whitespace-cleanup-mode
  :ensure t
  :config (global-whitespace-cleanup-mode))
;; javascript stuff
(setq js-indent-level 2)
;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-bullets)
(org-bullets-mode 1)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("●" "●" "●" "●" "●" "●" "●" "●" "●" "●" "●" "●" "●" "●" "●" "●"))
;; remove whitespace on save
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keyboard shortcuts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;; Magit
(global-set-key (kbd "C-c g") 'magit-status)
;; helm
;; Files in buffer
(global-set-key (kbd "C-c b") 'helm-mini)
;; Find files
(global-set-key (kbd "C-c f") 'helm-find-files)
;; Show files in directory
(global-set-key (kbd "C-x f") 'project-find-file)
;; Have helm take over meta-x
(global-set-key (kbd "M-x") #'helm-M-x)
;; sort lines
(global-set-key (kbd "C-c l") 'sort-lines)
;; Org keyboard shortcuts
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
;; Terminal shortcuts
(global-set-key (kbd "C-c t") 'shell)
;; Update packages with package-list-packages
(when (not package-archive-contents)
  (package-refresh-contents))
;; Load up shell properly on mac
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'org)
;; Start org mode file on load
(find-file "/Volumes/Home/Dropbox/org/life.org")
;; Set the location of Org files on your local system
(setq org-directory "/Volumes/Home/Dropbox/org")
;; calendar export for org
;; Set default calendar export
(setq org-icalendar-combined-agenda-file "/Volumes/Home/Dropbox/org/life.ics")
(setq org-icalendar-include-todo '(all))
(setq org-icalendar-with-timestamps 'active)
(setq org-icalendar-alarm-time 30)

(setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due)
      org-icalendar-use-scheduled '(event-if-todo event-if-not-todo todo-start))

;; this hook saves an ics file once an org-buffer is saved to life.ics
(defun my-icalendar-agenda-export()
  (if (string= (file-name-extension (buffer-file-name)) "org")
      (org-icalendar-combine-agenda-files))
  )
(add-hook 'after-save-hook 'my-icalendar-agenda-export)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode agenda options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;open agenda in current window
                                        ; (setq org-agenda-window-setup (quote current-window))
;;warn me of any deadlines in next 7 days
(setq org-deadline-warning-days 7)
;;show me tasks scheduled or due in next fortnight
(setq org-agenda-span (quote fortnight))
;;don't show tasks as scheduled if they are already shown as a deadline
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
;;don't give awarning colour to tasks with impending deadlines
;;if they are scheduled to be done
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
;;don't show tasks that are scheduled or have deadlines in the
;;normal todo list
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))
;;sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
      (quote
       ((agenda deadline-up priority-down)
        (todo priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep))))
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

