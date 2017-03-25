(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-enabled-themes (quote (base16-ocean)))
 '(custom-safe-themes
   (quote
    ("6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "b97a01622103266c1a26a032567e02d920b2c697ff69d40b7d9956821ab666cc" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "eb07ee737bae7860ff12a4dbd2dcb9ff9712e517cfd6279fa74f04a17b6e1ba6" "fee4e306d9070a55dce4d8e9d92d28bd9efe92625d2ba9d4d654fc9cd8113b7f" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "9122dfb203945f6e84b0de66d11a97de6c9edf28b3b5db772472e4beccc6b3c5" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "cdf96318f1671344564ba74ef75cc2a3f4692b2bee77de9ce9ff5f165de60b1f" "fb3e623e6c6e98f45aea182e56808a11d4c255490e49387a508bfc42251e15d0" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "21b6f06754acc3ea0bf1c325f373595cc824b641672bd944c9e66feb10a08da7" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" default)))
 '(fci-rule-color "#343d46")
 '(org-agenda-default-appointment-duration nil)
 '(org-agenda-files
   (quote
    ("/Volumes/Home/Dropbox/org/work.org" "/Volumes/Home/Dropbox/org/letters_to_leon.org" "/Volumes/Home/Dropbox/org/life.org")))
 '(package-selected-packages
   (quote
    (rainbow-mode spacegray-theme dracula-theme project-explorer evil-search-highlight-persist evil-leader evil-tabs cyberpunk-theme emmet-mode ag seoul256-theme fiplr ack rainbow-identifiers autopair web-mode exec-path-from-shell paredit use-package company ## magit nlinum-relative org-bullets whitespace-cleanup-mode flycheck base16-theme markdown-mode helm evil-visual-mark-mode)))
 '(vc-annotate-background nil)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-2 ((t (:inherit outline-2 :foreground "white"))))
 '(org-level-3 ((t (:inherit outline-3 :foreground "white"))))
 '(org-level-4 ((t (:inherit outline-4 :foreground "white"))))
 '(org-level-5 ((t (:inherit outline-5 :foreground "white"))))
 '(org-level-6 ((t (:inherit outline-6 :foreground "white"))))
 '(org-level-7 ((t (:inherit outline-7 :foreground "white"))))
 '(org-level-8 ((t (:inherit outline-8 :foreground "white")))))

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
(dolist (package '(autopair web-mode exec-path-from-shell paredit magit nlinum-relative org-bullets whitespace-cleanup-mode flycheck base16-theme markdown-mode helm evil-visual-mark-mode))
  (unless (package-installed-p package)
    (package-install package))
  (require package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme

(setq seoul256-background 234
      seoul256-alternate-background 252)
(load-theme 'seoul256 t)
;; Hide the stupid startupscreen
(setq inhibit-splash-screen t)
                                        ; Set font
(set-frame-font "SF Mono 12")
;; scroll 2 lines with scroll (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
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
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))
; (toggle-scroll-bar -1)
(tool-bar-mode -1)
;; Hide border frames
(fringe-mode 0)
;; Hide statusbar
; (setq-default mode-line-format nil)
;; word wrap
(visual-line-mode t)
;; Hide emphasis markers
(setq org-hide-emphasis-markers t)
;; Set size of inline images to 100
(setq org-image-actual-width '(10))
;; Change line spacing slightly
(setq line-spacing '0.10)
;; Autoclose brackets/pairs
(require 'autopair)
(autopair-global-mode)
;; start maximised
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Relative numbers
(require 'nlinum-relative)
;; setup for nlinum
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
;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; Auto indent with return key
(define-key global-map (kbd "RET") 'newline-and-indent)

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
(global-set-key (kbd "C-c C-f") 'project-find-file)
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
(when window-system
  (setenv "SHELL" "/usr/local/bin/bash")
  ;; `exec-path-from-shell' is slow, so bring out the cache
  (setq exec-path
        (eval-when-compile
          (require 'exec-path-from-shell)
          (exec-path-from-shell-initialize)
          exec-path)))

;; PS1 setup
(eval-after-load 'shell
  '(progn
     (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
     (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
     t))

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
;;warn me of any deadlines in next day
(setq org-deadline-warning-days 0)
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

(setq org-default-notes-file (concat org-directory "/Volumes/Home/Dropbox/org/life.org"))
(define-key global-map "\C-cc" 'org-capture)
;; change to new buffer changes
(global-set-key (kbd "C-c r") 'revert-buffer)
;; Rainbow identifiers
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)
;;Fiplr for fuzzy finding
(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(setq-default
   ;; js2-mode
   js2-basic-offset 2
   react-mode-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)
