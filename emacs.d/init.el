;; Get rid of the landing page and other UI elements
(setq inhibit-startup-message t)

(scroll-bar-mode -1)		;; Disable visable scroll bar
(tool-bar-mode -1)		;; Disable the tool bar
(tooltip-mode -1)		;; Disable tool tips
(menu-bar-mode nil)		;; Disable the Menu bar

;;(set-fringe-mode 10)		;;

;; Set the fonts
;;(set-face-attribute 'default nil :font "Fira Code Retina" :height 100)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "f703efe04a108fcd4ad104e045b391c706035bce0314a30d72fbf0840b355c2c" default))
 '(package-selected-packages
   '(fira-code-mode doom-modeline counsel ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )