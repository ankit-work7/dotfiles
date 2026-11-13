(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

;; Important for packages such as gptel which may need a newer
;; version of a package bundled with Emacs, such as Transient.
(setq package-install-upgrade-built-in t)

(require 'use-package)

(setq use-package-always-ensure t
      use-package-expand-minimally t)

(use-package emacs
  :ensure nil

  :init
  (setq confirm-kill-emacs #'yes-or-no-p
        inhibit-startup-screen t
        inhibit-startup-message t
        initial-scratch-message nil

        use-short-answers t

        create-lockfiles nil

        ;; Backups are handled separately below.
        make-backup-files t

        sentence-end-double-space nil
        require-final-newline t

        scroll-conservatively 101
        scroll-margin 4

        mouse-wheel-progressive-speed nil
        mouse-wheel-scroll-amount '(1 ((shift) . 1))

        tab-always-indent 'complete

        large-file-warning-threshold
        (* 100 1024 1024))

  :config

  ;; Keep normal Emacs UI.
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)

  (delete-selection-mode 1)
  (electric-pair-mode 1)
  (show-paren-mode 1)

  (global-auto-revert-mode 1)

  (save-place-mode 1)
  (savehist-mode 1)
  (recentf-mode 1)

  (repeat-mode 1)

  (global-so-long-mode 1)

  (column-number-mode 1)

  ;; Emacs 30 built-in EditorConfig support.
  (when (fboundp 'editorconfig-mode)
    (editorconfig-mode 1))

  ;; Smooth pixel scrolling.
  (when (fboundp 'pixel-scroll-precision-mode)
    (pixel-scroll-precision-mode 1)))

(setq-default indent-tabs-mode nil
              tab-width 4
              fill-column 80)

(set-face-attribute 'default nil
                    :family "Iosevka Nerd Font Mono"
                    :height 110
                    :weight 'regular)

(set-face-attribute 'fixed-pitch nil
                    :family "Iosevka Nerd Font Mono"
                    :height 1.0)

;; Ctrl+= also works without holding Shift to type a plus sign.
(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C-=") #'text-scale-increase)
(global-set-key (kbd "C--") #'text-scale-decrease)
(global-set-key (kbd "C-0") (lambda () (interactive) (text-scale-set 0)))
(global-set-key (kbd "C-<kp-add>") #'text-scale-increase)
(global-set-key (kbd "C-<kp-subtract>") #'text-scale-decrease)

;; Custom themes
(add-to-list
 'custom-theme-load-path
 (expand-file-name "themes/" user-emacs-directory))

;; Disable any theme already loaded.
(mapc #'disable-theme custom-enabled-themes)

(load-theme 'cursor-dark t)

(setq-default cursor-type 'box)

(setq x-stretch-cursor nil)

(blink-cursor-mode -1)

(setq display-line-numbers-type 'relative
      display-line-numbers-current-absolute t)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)

(setq auto-save-visited-interval 2)

(auto-save-visited-mode 1)

(defun my/save-all-buffers ()
  "Save modified file buffers without prompting."
  (save-some-buffers t))

(add-hook 'focus-out-hook #'my/save-all-buffers)

;; Keep traditional autosave files outside projects.
(defvar my/autosave-directory
  (expand-file-name "var/auto-save/" user-emacs-directory))

(make-directory my/autosave-directory t)

(setq auto-save-file-name-transforms
      `((".*" ,my/autosave-directory t)))

(defvar my/backup-directory
  (expand-file-name "var/backups/" user-emacs-directory))

(make-directory my/backup-directory t)

(setq backup-directory-alist
      `(("." . ,my/backup-directory))

      backup-by-copying t

      delete-old-versions t
      kept-new-versions 10
      kept-old-versions 3

      version-control t)

(use-package which-key
  :ensure t

  :custom
  (which-key-idle-delay 0.4)

  :config
  (which-key-mode 1))

(use-package vertico
  :init
  (vertico-mode 1)

  :custom
  (vertico-cycle t)
  (vertico-count 15))


(use-package orderless
  :custom
  (completion-styles '(orderless basic))

  (completion-category-defaults nil)

  (completion-category-overrides
   '((file (styles partial-completion)))))


(use-package marginalia
  :init
  (marginalia-mode 1))


(use-package consult
  :bind
  (("C-s"     . consult-line)

   ("s-s"     . consult-line)

   ("s-S"     . consult-ripgrep)

   ("C-x b"   . consult-buffer)

   ("M-y"     . consult-yank-pop)

   ("M-g g"   . consult-goto-line)

   ("M-g i"   . consult-imenu)

   ("M-g o"   . consult-outline)

   ("C-c s r" . consult-ripgrep)

   ("C-c s f" . consult-find)

   ("C-c s g" . consult-git-grep)))


(use-package embark
  :bind
  (("C-."   . embark-act)
   ("C-;"   . embark-dwim)
   ("C-h B" . embark-bindings))

  :init
  (setq prefix-help-command
        #'embark-prefix-help-command))


(use-package embark-consult
  :after (embark consult)

  :hook
  (embark-collect-mode
   . consult-preview-at-point-mode))

(use-package corfu
  :init
  (global-corfu-mode 1)

  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.08)
  (corfu-auto-prefix 2)

  (corfu-cycle t)
  (corfu-preselect 'prompt)

  (corfu-on-exact-match nil)

  (corfu-scroll-margin 5)

  :bind
  (:map corfu-map
        ("TAB" . corfu-complete)
        ([tab] . corfu-complete)))


(use-package corfu-popupinfo
  :ensure nil
  :after corfu

  :hook
  (corfu-mode . corfu-popupinfo-mode)

  :custom
  (corfu-popupinfo-delay '(0.5 . 0.2)))


(use-package cape
  :init

  (add-hook 'completion-at-point-functions
            #'cape-file)

  (add-hook 'completion-at-point-functions
            #'cape-dabbrev))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

(setq treesit-font-lock-level 4)

(use-package treesit-auto
  :custom

  (treesit-auto-install 'prompt)

  :config

  (treesit-auto-add-to-auto-mode-alist 'all)

  (global-treesit-auto-mode 1))

(use-package eglot
  :ensure nil

  :custom

  (eglot-autoshutdown t)

  (eglot-confirm-server-initiated-edits nil)

  :hook

  ((python-mode    . eglot-ensure)
   (python-ts-mode . eglot-ensure)

   (c-mode         . eglot-ensure)
   (c-ts-mode      . eglot-ensure)

   (c++-mode       . eglot-ensure)
   (c++-ts-mode    . eglot-ensure)

   (rust-mode      . eglot-ensure)
   (rust-ts-mode   . eglot-ensure))

  :config

  ;; Python
  (add-to-list
   'eglot-server-programs
   '((python-mode python-ts-mode)
     "basedpyright-langserver"
     "--stdio"))

  ;; C / C++
  (add-to-list
   'eglot-server-programs
   '((c-mode
      c-ts-mode
      c++-mode
      c++-ts-mode)

     "clangd"

     "--background-index"

     "--clang-tidy"

     "--completion-style=detailed"

     "--header-insertion=never"))

  ;; Rust
  (add-to-list
   'eglot-server-programs

   '((rust-mode rust-ts-mode)
     "rust-analyzer"))

  (setq-default

   eglot-workspace-configuration

   '(:basedpyright

     (:typeCheckingMode "recommended")

     :basedpyright.analysis

     (:diagnosticMode "workspace"
      :autoImportCompletions t)

     :rust-analyzer

     (:check
      (:command "clippy")

      :cargo
      (:buildScripts
       (:enable t))

      :procMacro
      (:enable t))))

  (add-hook
   'eglot-managed-mode-hook

   (lambda ()
     (when (fboundp 'eglot-inlay-hints-mode)
       (eglot-inlay-hints-mode 1)))))

(use-package consult-eglot
  :after (consult eglot)

  :bind
  ("C-c l s" . consult-eglot-symbols))

(use-package flymake
  :ensure nil

  :bind
  (:map flymake-mode-map

        ("M-n" . flymake-goto-next-error)

        ("M-p" . flymake-goto-prev-error)

        ("C-c ! l"
         . flymake-show-buffer-diagnostics)

        ("C-c ! p"
         . flymake-show-project-diagnostics)))


(defun my/flymake-ruff-maybe ()
  (when (derived-mode-p
         'python-mode
         'python-ts-mode)

    (flymake-ruff-load)))


(use-package flymake-ruff
  :after eglot

  :hook
  (eglot-managed-mode
   . my/flymake-ruff-maybe))

(use-package apheleia
  :config

  ;; Python -> Ruff formatter.
  (setf
   (alist-get 'ruff apheleia-formatters)

   '("ruff"
     "format"
     "--stdin-filename"
     filepath
     "-"))

  (setf
   (alist-get 'python-mode
              apheleia-mode-alist)

   'ruff)

  (setf
   (alist-get 'python-ts-mode
              apheleia-mode-alist)

   'ruff)

  (apheleia-global-mode 1))

(use-package exec-path-from-shell
  :if (memq window-system
            '(mac ns pgtk))

  :config
  (exec-path-from-shell-initialize))


(use-package envrc
  :hook
  (after-init
   . envrc-global-mode))

(use-package project
  :ensure nil

  :bind-keymap
  ("C-c P"
   . project-prefix-map)

  :custom
  (project-switch-use-entire-map t))

(use-package projectile
  :demand t
  :custom
  (projectile-completion-system 'default)
  :config
  (define-key projectile-mode-map (kbd "C-c p") projectile-command-map)
  (define-key projectile-command-map (kbd "a") #'projectile-add-known-project)
  (projectile-mode 1))

(use-package avy
  :bind
  (("M-j"
    . avy-goto-char-timer)))

(use-package magit
  :bind
  (("C-x g"
    . magit-status)

   ("C-c g b"
    . magit-blame-addition)

   ("C-c g l"
    . magit-log-current)))


(use-package diff-hl
  :config

  (global-diff-hl-mode 1)

  (diff-hl-flydiff-mode 1)

  :hook
  (dired-mode
   . diff-hl-dired-mode))

(use-package compile
  :ensure nil

  :bind
  (("C-c x c"
    . compile)

   ("C-c x r"
    . recompile))

  :custom

  (compilation-scroll-output
   'first-error)

  (compilation-always-kill t)

  (compilation-ask-about-save nil))

(use-package dape
  :commands dape

  :bind

  (("C-c d d"
    . dape)

   ("C-c d b"
    . dape-breakpoint-toggle)))

(use-package vterm
  :commands vterm

  :custom

  (vterm-max-scrollback 100000)

  :bind
  (("C-c t t"
    . vterm)))


(defun my/project-vterm ()
  "Open a vterm rooted at the current project."
  (interactive)

  (let* ((project
          (project-current t))

         (root
          (project-root project))

         (default-directory root)

         (name
          (format
           "*vterm:%s*"

           (file-name-nondirectory
            (directory-file-name root)))))

    (vterm name)))


(global-set-key
 (kbd "C-c t p")
 #'my/project-vterm)

(use-package dired
  :ensure nil

  :bind
  ("C-x C-j"
   . dired-jump)

  :custom

  (dired-kill-when-opening-new-dired-buffer t)

  (dired-dwim-target t))

;; Respect the desktop's default browser for external links and previews.
(setq browse-url-browser-function #'browse-url-xdg-open)

(use-package markdown-mode
  :bind (:map markdown-mode-map
              ("C-c C-c p" . markdown-live-preview-mode)
              ("C-c C-c b" . markdown-preview))
  :mode
  (("\\.md\\'"       . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)
   ("README\\.md\\'" . gfm-mode))

  :custom

  ;; Side-by-side live preview.
  (markdown-split-window-direction 'right)
  (markdown-live-preview-window-function #'markdown-live-preview-window-eww)

  ;; Delete generated preview file when closing preview.
  (markdown-live-preview-delete-export
   'delete-on-destroy)

  :config

  ;; Pandoc gives excellent rendering if installed.
  (when (executable-find "pandoc")
    (setq markdown-command "pandoc")))

(defvar my/org-directory
  (expand-file-name "~/org/org-notes/"))

(make-directory
 my/org-directory
 t)


(use-package org
  :ensure nil

  :bind

  (("C-c a"
    . org-agenda)

   ("C-c c"
    . org-capture))

  :custom

  (org-directory
   my/org-directory)

  (org-agenda-files
   (list

    (expand-file-name
     "inbox.org"
     my/org-directory)

    (expand-file-name
     "tasks.org"
     my/org-directory)

    (expand-file-name
     "calendar.org"
     my/org-directory)

    (expand-file-name
     "calendar-inbox.org"
     my/org-directory)))

  (org-log-done 'time)

  (org-log-into-drawer t)

  (org-return-follows-link t)

  (org-use-speed-commands t)

  (org-hide-emphasis-markers t)

  ;; Keep snake_case identifiers literal; subscripts require x_{i}.
  (org-use-sub-superscripts '{})
  (org-export-with-sub-superscripts '{})

  (org-pretty-entities t)

  (org-startup-indented t)

  (org-startup-folded 'content)

  (org-ellipsis " …")

  (org-todo-keywords

   '((sequence

      "TODO(t)"

      "NEXT(n)"

      "WAIT(w@)"

      "|"

      "DONE(d!)"

      "CANCELLED(c@)")))

  :config

  (setq
   org-capture-templates

   `(("t"
      "Task"

      entry

      (file
       ,(expand-file-name
         "inbox.org"
         my/org-directory))

      "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n")


     ("n"
      "Note"

      entry

      (file
       ,(expand-file-name
         "notes.org"
         my/org-directory))

      "* %?\n%U\n")


     ("m"
      "Meeting"

      entry

      (file
       ,(expand-file-name
         "calendar.org"
         my/org-directory))

      "* %? :meeting:\n%T\n"))))

(use-package org-modern
  :after org

  :hook

  (org-mode
   . org-modern-mode)

  (org-agenda-finalize
   . org-modern-agenda)

  :custom

  ;; IMPORTANT:
  ;; use replacement symbols instead of triangle folding markers.
  (org-modern-star 'replace)

  (org-modern-replace-stars
   '("●" "○" "•" "◦" "▪" "▫"))

  (org-modern-hide-stars 'leading)

  (org-modern-table t))

(with-eval-after-load 'org

  (set-face-attribute
   'org-link
   nil

   :foreground "#9ccfd8"

   :underline t

   :weight 'medium))

(with-eval-after-load 'org

  (require 'org-tempo)

  (add-to-list
   'org-structure-template-alist
   '("py" . "src python"))

  (add-to-list
   'org-structure-template-alist
   '("cpp" . "src cpp"))

  (add-to-list
   'org-structure-template-alist
   '("cc" . "src C"))

  (add-to-list
   'org-structure-template-alist
   '("rs" . "src rust"))

  (add-to-list
   'org-structure-template-alist
   '("el" . "src emacs-lisp"))

  (add-to-list
   'org-structure-template-alist
   '("sh" . "src shell")))

(use-package toc-org
  :hook
  (org-mode
   . toc-org-mode)

  :custom
  (toc-org-max-depth 4))

(use-package org-roam

  :custom

  (org-roam-directory
   (file-truename
    "~/org/org-notes/roam"))

  (org-roam-completion-everywhere t)

  :bind

  (("C-c n f"
    . org-roam-node-find)

   ("C-c n i"
    . org-roam-node-insert)

   ("C-c n c"
    . org-roam-capture)

   ("C-c n b"
    . org-roam-buffer-toggle)

   ("C-c n d"
    . org-roam-dailies-capture-today)

   ("C-c n t"
    . org-roam-dailies-goto-today))

  :config

  (make-directory org-roam-directory t)
  (org-roam-db-autosync-mode 1)

  (setq

   org-roam-capture-templates

   '(("d"
      "default"

      plain

      "%?"

      :target

      (file+head
       "${slug}.org"
       "#+title: ${title}\n")

      :unnarrowed t)))


  (setq

   org-roam-dailies-directory
   "daily/"

   org-roam-dailies-capture-templates

   '(("d"
      "daily"

      entry

      "* %?"

      :target

      (file+head
       "%<%Y-%m-%d>.org"
       "#+title: %<%Y-%m-%d>\n")))))

(use-package org-super-agenda
  :after org-agenda

  :config

  (org-super-agenda-mode 1)

  (setq

   org-super-agenda-groups

   '((:name "Today"
            :time-grid t
            :scheduled today)

     (:name "Important"
            :priority "A")

     (:name "Next"
            :todo "NEXT")

     (:name "Waiting"
            :todo "WAIT")

     (:name "Due Soon"
            :deadline future)

     (:name "Overdue"
            :deadline past)

     (:discard
      (:anything t)))))

(use-package olivetti
  :commands olivetti-mode

  :custom

  (olivetti-body-width 100))


(defun my/org-zen-mode ()
  "Toggle focused Org writing mode."
  (interactive)

  (if olivetti-mode

      (progn

        (olivetti-mode -1)

        (display-line-numbers-mode 1))

    (olivetti-mode 1)

    (display-line-numbers-mode -1)))


(global-set-key
 (kbd "C-c z")
 #'my/org-zen-mode)

(use-package org-caldav
  :after org

  :commands
  org-caldav-sync

  :custom

  (org-caldav-inbox
   (expand-file-name
    "calendar-inbox.org"
    my/org-directory))

  (org-caldav-files
   (list
    (expand-file-name
     "calendar.org"
     my/org-directory)))

  ;; Start safely.
  ;; Change to 'twoway only after your dedicated
  ;; iCloud Org calendar is working correctly.
  (org-caldav-sync-direction
   'cal->org)

  (org-icalendar-timezone
   "Asia/Kolkata")

  (org-caldav-delete-calendar-entries
   'ask)

  (org-caldav-delete-org-entries
   'ask))

(defun my/open-emacs-config ()
  "Open the literate Emacs configuration."
  (interactive)

  (find-file
   (expand-file-name
    "config.org"
    user-emacs-directory)))


(global-set-key
 (kbd "C-c e c")
 #'my/open-emacs-config)

(defun my/package-upgrade-all ()
  "Refresh archives and upgrade installed ELPA packages."
  (interactive)

  (package-refresh-contents)

  (package-upgrade-all))


(global-set-key
 (kbd "C-c e u")
 #'my/package-upgrade-all)

(defun my/search-project ()
  "Search the current Projectile project with live Consult results."
  (interactive)
  (consult-ripgrep (projectile-project-root)))

;; Uppercase letters mean Super+Shift+letter.
(global-set-key (kbd "s-f") #'consult-line)
(global-set-key (kbd "s-F") #'my/search-project)
(global-set-key (kbd "s-b") #'consult-buffer)
(global-set-key (kbd "s-p") #'projectile-find-file)
(global-set-key (kbd "s-P") #'projectile-switch-project)
(global-set-key (kbd "s-o") #'find-file)
(global-set-key (kbd "s-r") #'consult-recent-file)
(global-set-key (kbd "s-e") #'execute-extended-command)
(global-set-key (kbd "s-i") #'consult-imenu)
(global-set-key (kbd "s-v") #'consult-yank-pop)
(global-set-key (kbd "s-g") #'magit-status)
(global-set-key (kbd "s-j") #'avy-goto-char-timer)
;; Retain the previous search shortcuts as aliases.
(global-set-key (kbd "s-S") #'my/search-project)

(defun my/enable-auto-fill ()
  "Insert real line breaks at 80 columns in text and source buffers."
  (when (and (not (minibufferp))
             (not buffer-read-only)
             (or (derived-mode-p 'text-mode 'prog-mode)
                 (eq major-mode 'fundamental-mode)))
    (setq-local fill-column 80)
    (setq-local comment-auto-fill-only-comments nil)
    (auto-fill-mode 1)))

(add-hook 'after-change-major-mode-hook #'my/enable-auto-fill)
;; Also apply when reloading the configuration in an existing session.
(dolist (buffer (buffer-list))
  (with-current-buffer buffer
    (my/enable-auto-fill)))
