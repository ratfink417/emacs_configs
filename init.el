;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Editor Settings                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Get rid of the landing page and other UI elements
(setq inhibit-startup-message t)

(scroll-bar-mode -1)		;; Disable visable scroll bar
(tool-bar-mode -1)		;; Disable the tool bar
(tooltip-mode -1)		;; Disable tool tips
(menu-bar-mode -1)		;; Disable the Menu bar
(display-time)
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set the fonts
(set-face-attribute 'default nil :font "Fira Code Retina" :height 100)

;; Set a theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") ;; set a path to look for my extra theme files that have been downloaded
(load-theme 'moe-dark t)

;; Initialize package sources
(require 'package)             ;; Ensure that the "package" package is loaded so that
			       ;; we can install or load shit as well as other package functions
;; package-archives is a list variable that the package command uses to fetch from
;; so it's where we define all the repositories we wanna use and I'll use these repos
(setq package-archives '(("melpa"  . "https://melpa.org/packages/")
			 ("org"    . "https://orgmode.org/elpa/")
			 ("elpa"   . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; Prepare the package system to be used
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Configurations and Mode settings                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ivy-mode settings

;; Set up the Ivy completion framework
;; This gives you a cool pop-up menu for command completion that opens whenver you press M-x
;; and these settings here are just to make vim key bindings for navigating that menu
(use-package ivy
  :diminish 		;; keeps the (ivy mode) tag off of the mode-line
  			;; at the bottom of the screen.  normally this would
			;; keep informed about the active major modes it's distracting...

  :bind (("C-s" . swiper)            ;; Open "swiper" to search inside the buffer you were just editing in

	 :map ivy-minibuffer-map     ;; This variable sets key bindings for the ivy-mini-buffer-map keymap
	 ("TAB" . ivy-alt-done)      ;; close a minibuffer
	 ("C-l" . ivy-alt-done)      ;; close a minibugger
	 ("C-j" . ivy-next-line)     ;; navigate up
	 ("C-k" . ivy-previous-line) ;; navigate down

	 :map ivy-switch-buffer-map  ;; This variable sets the key bindings for the ivy-switch-buffer-map keymap
	 ("C-k" . ivy-previous-line) ;; The ivy-switch-buffer map defines keys used with the ivy-switch-buffer command
         ("C-l" . ivy-done)          ;; which gives you a menu to select a buffer you'd like to open in the pane that is
	 ("C-d" . ivy-buffer-kill)   ;; currently in focus. Opens when you press "C-x b"

	 :map ivy-reverse-i-search-map ;; This variable sets the key bindings for the ivy-reverse-i-search-map keymap
	 ("C-k" . ivy-previous-line)          ;; the reverse interactive search is the ivy buffer that opens when you
	 ("C-d" . ivy-reverse-i-search-kill)) ;; press "C-r" in a buffer
  :config
  (ivy-mode 1))

;; Doom mode-line settings

;; Set up the Doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Set up Evil mode for vim key bindings
(require 'evil)
(evil-mode 1)

;; Set up a dashboard
(dashboard-setup-startup-hook)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-startup-banner "~/.emacs.d/laffingman.png") ;; Set the logo image
(setq dashboard-banner-logo-title "Or should I ? ...")
