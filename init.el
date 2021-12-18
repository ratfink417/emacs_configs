;; Get rid of the landing page and other UI elements
(setq inhibit-startup-message t)

(scroll-bar-mode -1)		;; Disable visable scroll bar
(tool-bar-mode -1)		;; Disable the tool bar
(tooltip-mode -1)		;; Disable tool tips
(menu-bar-mode -1)		;; Disable the Menu bar

(set-fringe-mode 10)		;;

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set the fonts
(set-face-attribute 'default nil :font "Fira Code Retina" :height 100)

;; Set a theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") ;; set a path to look for my extra theme files that have been downloaded
(load-theme 'moe-dark t)

;; Initialize package sources
(require 'package)             ;; Ensure that the package package is loaded so that we can install or load shit and other package functions

(setq package-archives '(("melpa" . "https://melpa.org/packages/")            ;; package-archives is a list variable that the package command uses to fetch from
			 ("org" . "https://orgmode.org/elpa/")                ;; so it's where we define all the repositories we wanna use
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)                     ;; Prepares the package system to be used
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)
;; Set up the Ivy completion framework
;; This gives you a cool pop-up menu for command completion that opens whenver you press M-x
;; and these settings here are just to make vim key bindings for navigating that menu
(use-package ivy
  :diminish ;; keeps the (ivy mode) tag off of the mode-line at the bottom of the screen. keeps you from being informed of the active major modes but keeps it pretty
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map ;; Sets key bindings for the ivy-mini-buffer-map minor mode
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map ;; Sets the key bindings for the ivy-switch-buffer-map minor mode
	 ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
	 ("C-d" . ivy-buffer-kill)
	 :map ivy-reverse-i-search-map ;; Sets the key bindings for the ivy-reverse-i-search-map minor mode
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; Set up the Doom modeline
(require 'doom-modeline)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
