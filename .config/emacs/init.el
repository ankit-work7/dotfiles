;; Ensure Org Mode is loaded
(require 'org)

;; Load and execute the literate configuration
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lorem-ipsum yasnippet-snippets which-key vterm vertico treesit-auto toc-org projectile org-super-agenda org-roam org-modern org-caldav orderless olivetti markdown-mode marginalia magit flymake-ruff exec-path-from-shell envrc embark-consult diff-hl dape corfu consult-eglot cape base16-theme avy apheleia)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
