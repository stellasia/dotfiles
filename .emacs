;; ==============================
;; .emacs configuration file
;; ==============================

(add-to-list 'load-path "~/.emacs.d/")

(require 'ido)
(ido-mode t)

;; use standard keys for undo cut copy paste
;(cua-mode 1)

;; accents circonflexes
(load-library "iso-transl")

;; -------------
;; Custom window
;; -------------

;; Remove welcome screen... 
(setq inhibit-startup-screen t)

;; theme
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-deep-blue)
(load-theme 'misterioso)

;; Remove toolbar
 (tool-bar-mode -1)
; (menu-bar-mode -1)

;; Scroll bar on the right
(set-scroll-bar-mode 'right)   ; replace 'right with 'left to place it to the left

;; Text font
(set-default-font "DejaVu Sans Mono-12")

;; Cursor
(setq blink-cursor-mode nil)
(set-cursor-color "#4D5054") 

;; Mouse wheel
(require 'mwheel)
(mwheel-install) 

;; Stop cursor blink
(blink-cursor-mode 0)

;; display line numbers to the right of the window
(global-linum-mode t)

;; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)

;; Show time in the stats bar
(display-time)  
(setq display-time-24hr-format t)

;; Visual bip
(setq visible-bell t)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode t)
; background color for highlighted line
(set-face-background 'hl-line "#4D5054")
; do not change foreground color for highlighted line (conserve syntax highlighter colors if any)
(set-face-foreground 'highlight nil)
(set-face-foreground 'region nil)
;(setq highlight-current-line-globally t)
;(setq highlight-current-line-high-faces nil)
;(setq highlight-current-line-whole-line nil)
;(setq hl-line-face (quote highlight))


; text decoration
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(global-hi-lock-mode nil)
(setq jit-lock-contextually t)
(setq jit-lock-stealth-verbose t)

;; -------------
;; Misc
;; -------------

;; Answer 'y'/'n' instead of 'yes'/'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use backslash to delete selected text
(pending-delete-mode t)

;; Search case insensitive
(setq case-fold-search t)

;; Tab length
(setq c-basic-offset 4)

;; Insert spaces instead of tabs
(setq indent-tabs-mode nil)

;; Autoparentheses
(require 'paren)
(show-paren-mode t)

;; Do not save ~ backup files
(setq make-backup-files nil)



;; -------------
;; List directory
;; -------------
;;(require 'dirtree) ;; replaced with ecb



;; -------------
;; Pythons specific
;; -------------
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

; use the wx backend, for both mayavi and matplotlib
;;(setq py-python-command-args
;;  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;;(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)

; try to automagically figure out indentation
(setq py-smart-indentation t)

;; set '_' a word separator for Ctrl+left/right navigation
; (modify-syntax-entry ?_ "_" python-mode-syntax-table)


(custom-set-variables
 ;; Your init file should contain only one such instance.
 '(ecb-options-version "2.40"))


;;; activate and deactivate ecb
(global-set-key (kbd "C-x C-;") 'ecb-activate)
(global-set-key (kbd "C-x C-'") 'ecb-deactivate)
;;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key (kbd "C-)") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-!") 'ecb-goto-window-directories)
(global-set-key (kbd "C-@") 'ecb-goto-window-sources)
(global-set-key (kbd "C-#") 'ecb-goto-window-methods)
(global-set-key (kbd "C-$") 'ecb-goto-window-compilation)


(require 'web-mode) 
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.jhtml\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.md\\'" . web-mode)) 


(require 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.jhtml\\'" . jinja2-mode)) 
