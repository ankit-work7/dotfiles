;;; cursor-dark-theme.el --- Cursor Dark theme -*- lexical-binding: t; -*-

(deftheme cursor-dark
  "Cursor Dark theme ported from Cursor Theme Pack for Zed.")

(let* (;; Core UI
       (bg             "#181818")
       (bg-alt         "#141414")
       (bg-highlight   "#262626")
       (bg-selection   "#404040")
       (fg             "#e4e4e4")
       (fg-muted       "#898989")
       (fg-dim         "#666666")
       (border         "#303030")

       ;; Syntax
       (cyan           "#82d2ce")
       (cyan-alt       "#88c0d0")
       (blue           "#81a1c1")
       (blue-bright    "#87a6c4")
       (purple         "#aaa0fa")
       (magenta        "#e394dc")
       (peach          "#efb080")
       (yellow         "#ebc88d")
       (yellow-bright  "#f1b467")
       (orange         "#d2943e")
       (red            "#e34671")
       (red-bright     "#fc6b83")
       (red-muted      "#cc7c8a")
       (green          "#3fa266")
       (green-bright   "#70b489")
       (punctuation    "#a4a4a4")

       ;; Git / diagnostics
       (added          "#3fa266")
       (changed        "#d2943e")
       (removed        "#e34671"))

  (custom-theme-set-faces
   'cursor-dark

   ;; ------------------------------------------------------------
   ;; Base Emacs
   ;; ------------------------------------------------------------

   `(default ((t (:background ,bg
                  :foreground ,fg))))

   `(cursor ((t (:background ,blue))))

   `(fringe ((t (:background ,bg
                 :foreground ,fg-dim))))

   `(region ((t (:background ,bg-selection
                 :extend t))))

   `(secondary-selection
     ((t (:background "#303030"))))

   `(highlight
     ((t (:background ,bg-highlight))))

   `(hl-line
     ((t (:background ,bg-highlight
          :extend t))))

   `(vertical-border
     ((t (:foreground ,border))))

   `(window-divider
     ((t (:foreground ,border))))

   `(window-divider-first-pixel
     ((t (:foreground ,border))))

   `(window-divider-last-pixel
     ((t (:foreground ,border))))

   `(shadow
     ((t (:foreground ,fg-dim))))

   `(success
     ((t (:foreground ,green))))

   `(warning
     ((t (:foreground ,yellow-bright))))

   `(error
     ((t (:foreground ,red))))

   `(link
     ((t (:foreground ,blue
          :underline t))))

   `(link-visited
     ((t (:foreground ,purple
          :underline t))))

   `(button
     ((t (:foreground ,blue
          :underline t))))

   ;; ------------------------------------------------------------
   ;; Line numbers
   ;; ------------------------------------------------------------

   `(line-number
     ((t (:background ,bg
          :foreground ,fg-dim))))

   `(line-number-current-line
     ((t (:background ,bg
          :foreground ,fg
          :weight bold))))

   ;; ------------------------------------------------------------
   ;; Minibuffer
   ;; ------------------------------------------------------------

   `(minibuffer-prompt
     ((t (:foreground ,blue
          :weight bold))))

   ;; ------------------------------------------------------------
   ;; Mode line
   ;; ------------------------------------------------------------

   `(mode-line
     ((t (:background ,bg-alt
          :foreground ,fg
          :box (:line-width 1 :color ,border)))))

   `(mode-line-inactive
     ((t (:background ,bg-alt
          :foreground ,fg-muted
          :box (:line-width 1 :color ,border)))))

   `(mode-line-buffer-id
     ((t (:foreground ,fg
          :weight bold))))

   ;; ------------------------------------------------------------
   ;; Header line
   ;; ------------------------------------------------------------

   `(header-line
     ((t (:background ,bg-alt
          :foreground ,fg-muted
          :box nil))))

   ;; ------------------------------------------------------------
   ;; Tab bar
   ;; ------------------------------------------------------------

   `(tab-bar
     ((t (:background ,bg-alt
          :foreground ,fg-muted))))

   `(tab-bar-tab
     ((t (:background ,bg
          :foreground ,fg
          :box nil))))

   `(tab-bar-tab-inactive
     ((t (:background ,bg-alt
          :foreground ,fg-muted
          :box nil))))

   ;; ------------------------------------------------------------
   ;; Font Lock — syntax highlighting
   ;; ------------------------------------------------------------

   `(font-lock-builtin-face
     ((t (:foreground ,cyan))))

   `(font-lock-comment-face
     ((t (:foreground ,fg-dim
          :slant italic))))

   `(font-lock-comment-delimiter-face
     ((t (:foreground ,fg-dim
          :slant italic))))

   `(font-lock-doc-face
     ((t (:foreground ,fg-dim
          :slant italic))))

   `(font-lock-constant-face
     ((t (:foreground ,yellow))))

   `(font-lock-function-name-face
     ((t (:foreground ,peach))))

   `(font-lock-function-call-face
     ((t (:foreground ,peach))))

   `(font-lock-keyword-face
     ((t (:foreground ,cyan))))

   `(font-lock-negation-char-face
     ((t (:foreground ,cyan))))

   `(font-lock-number-face
     ((t (:foreground ,yellow))))

   `(font-lock-operator-face
     ((t (:foreground ,fg))))

   `(font-lock-preprocessor-face
     ((t (:foreground ,purple))))

   `(font-lock-property-name-face
     ((t (:foreground ,purple))))

   `(font-lock-property-use-face
     ((t (:foreground ,purple))))

   `(font-lock-punctuation-face
     ((t (:foreground ,punctuation))))

   `(font-lock-string-face
     ((t (:foreground ,magenta))))

   `(font-lock-type-face
     ((t (:foreground ,peach))))

   `(font-lock-variable-name-face
     ((t (:foreground ,fg))))

   `(font-lock-variable-use-face
     ((t (:foreground ,fg))))

   `(font-lock-warning-face
     ((t (:foreground ,yellow-bright
          :weight bold))))

   ;; ------------------------------------------------------------
   ;; Search
   ;; ------------------------------------------------------------

   `(isearch
     ((t (:background "#435a63"
          :foreground ,fg
          :weight bold))))

   `(lazy-highlight
     ((t (:background "#33464d"
          :foreground ,fg))))

   `(isearch-fail
     ((t (:background ,red
          :foreground ,bg))))

   `(match
     ((t (:background "#33464d"
          :foreground ,fg))))

   ;; ------------------------------------------------------------
   ;; Parentheses
   ;; ------------------------------------------------------------

   `(show-paren-match
     ((t (:foreground ,cyan
          :background "#303030"
          :weight bold))))

   `(show-paren-mismatch
     ((t (:foreground ,red
          :background "#402020"
          :weight bold))))

   ;; ------------------------------------------------------------
   ;; Org Mode
   ;; ------------------------------------------------------------

   `(org-document-title
     ((t (:foreground ,fg
          :weight bold
          :height 1.4))))

   `(org-document-info
     ((t (:foreground ,fg-muted))))

   `(org-level-1
     ((t (:foreground ,peach
          :weight bold
          :height 1.20))))

   `(org-level-2
     ((t (:foreground ,cyan
          :weight bold
          :height 1.15))))

   `(org-level-3
     ((t (:foreground ,purple
          :weight bold
          :height 1.10))))

   `(org-level-4
     ((t (:foreground ,magenta
          :weight bold))))

   `(org-level-5
     ((t (:foreground ,blue
          :weight bold))))

   `(org-level-6
     ((t (:foreground ,yellow
          :weight bold))))

   `(org-level-7
     ((t (:foreground ,green))))

   `(org-level-8
     ((t (:foreground ,red-muted))))

   `(org-code
     ((t (:foreground ,magenta))))

   `(org-verbatim
     ((t (:foreground ,yellow))))

   `(org-block
     ((t (:background ,bg-alt
          :foreground ,fg
          :extend t))))

   `(org-block-begin-line
     ((t (:background ,bg-alt
          :foreground ,fg-dim
          :slant italic
          :extend t))))

   `(org-block-end-line
     ((t (:background ,bg-alt
          :foreground ,fg-dim
          :slant italic
          :extend t))))

   `(org-meta-line
     ((t (:foreground ,fg-dim))))

   `(org-special-keyword
     ((t (:foreground ,fg-dim))))

   `(org-link
     ((t (:foreground ,blue
          :underline t))))

   `(org-todo
     ((t (:foreground ,red-bright
          :weight bold))))

   `(org-done
     ((t (:foreground ,green
          :weight bold))))

   `(org-date
     ((t (:foreground ,cyan-alt))))

   `(org-tag
     ((t (:foreground ,purple
          :weight normal))))

   `(org-table
     ((t (:foreground ,cyan-alt))))

   `(org-checkbox
     ((t (:foreground ,blue
          :weight bold))))

   `(org-ellipsis
     ((t (:foreground ,fg-dim))))

   `(org-drawer
     ((t (:foreground ,fg-dim))))

   ;; ------------------------------------------------------------
   ;; Markdown
   ;; ------------------------------------------------------------

   `(markdown-header-face-1
     ((t (:foreground ,peach
          :weight bold
          :height 1.2))))

   `(markdown-header-face-2
     ((t (:foreground ,cyan
          :weight bold
          :height 1.15))))

   `(markdown-header-face-3
     ((t (:foreground ,purple
          :weight bold
          :height 1.1))))

   `(markdown-code-face
     ((t (:background ,bg-alt
          :foreground ,magenta))))

   `(markdown-inline-code-face
     ((t (:foreground ,magenta))))

   `(markdown-link-face
     ((t (:foreground ,blue))))

   `(markdown-url-face
     ((t (:foreground ,fg-muted))))

   ;; ------------------------------------------------------------
   ;; Dired
   ;; ------------------------------------------------------------

   `(dired-directory
     ((t (:foreground ,blue
          :weight bold))))

   `(dired-symlink
     ((t (:foreground ,cyan))))

   `(dired-header
     ((t (:foreground ,peach
          :weight bold))))

   `(dired-mark
     ((t (:foreground ,yellow))))

   `(dired-marked
     ((t (:foreground ,yellow
          :weight bold))))

   ;; ------------------------------------------------------------
   ;; Completion / Vertico
   ;; ------------------------------------------------------------

   `(completions-common-part
     ((t (:foreground ,cyan
          :weight bold))))

   `(completions-first-difference
     ((t (:foreground ,fg))))

   `(vertico-current
     ((t (:background ,bg-highlight
          :foreground ,fg
          :extend t))))

   ;; ------------------------------------------------------------
   ;; Corfu
   ;; ------------------------------------------------------------

   `(corfu-default
     ((t (:background ,bg-alt
          :foreground ,fg))))

   `(corfu-current
     ((t (:background ,bg-highlight
          :foreground ,fg))))

   `(corfu-border
     ((t (:background ,border))))

   ;; ------------------------------------------------------------
   ;; Company
   ;; ------------------------------------------------------------

   `(company-tooltip
     ((t (:background ,bg-alt
          :foreground ,fg))))

   `(company-tooltip-selection
     ((t (:background ,bg-highlight
          :foreground ,fg))))

   `(company-tooltip-common
     ((t (:foreground ,cyan
          :weight bold))))

   `(company-scrollbar-bg
     ((t (:background ,bg-alt))))

   `(company-scrollbar-fg
     ((t (:background ,fg-dim))))

   ;; ------------------------------------------------------------
   ;; Flymake / diagnostics
   ;; ------------------------------------------------------------

   `(flymake-error
     ((t (:underline (:style wave :color ,red)))))

   `(flymake-warning
     ((t (:underline (:style wave :color ,yellow-bright)))))

   `(flymake-note
     ((t (:underline (:style wave :color ,cyan-alt)))))

   ;; ------------------------------------------------------------
   ;; Flycheck
   ;; ------------------------------------------------------------

   `(flycheck-error
     ((t (:underline (:style wave :color ,red)))))

   `(flycheck-warning
     ((t (:underline (:style wave :color ,yellow-bright)))))

   `(flycheck-info
     ((t (:underline (:style wave :color ,cyan-alt)))))

   ;; ------------------------------------------------------------
   ;; Diff
   ;; ------------------------------------------------------------

   `(diff-added
     ((t (:background "#193323"
          :foreground ,added))))

   `(diff-removed
     ((t (:background "#351b25"
          :foreground ,removed))))

   `(diff-changed
     ((t (:background "#332a1c"
          :foreground ,changed))))

   `(diff-header
     ((t (:background ,bg-alt
          :foreground ,fg-muted))))

   `(diff-file-header
     ((t (:background ,bg-alt
          :foreground ,fg
          :weight bold))))

   ;; ------------------------------------------------------------
   ;; Magit
   ;; ------------------------------------------------------------

   `(magit-section-heading
     ((t (:foreground ,peach
          :weight bold))))

   `(magit-section-highlight
     ((t (:background ,bg-highlight))))

   `(magit-branch-local
     ((t (:foreground ,cyan))))

   `(magit-branch-remote
     ((t (:foreground ,green))))

   `(magit-hash
     ((t (:foreground ,fg-dim))))

   `(magit-diff-added
     ((t (:background "#193323"
          :foreground ,added))))

   `(magit-diff-added-highlight
     ((t (:background "#20402b"
          :foreground ,green-bright))))

   `(magit-diff-removed
     ((t (:background "#351b25"
          :foreground ,removed))))

   `(magit-diff-removed-highlight
     ((t (:background "#48212d"
          :foreground ,red-bright))))

   `(magit-diff-context-highlight
     ((t (:background ,bg-highlight))))

   `(magit-diff-hunk-heading
     ((t (:background "#303030"
          :foreground ,fg-muted))))

   `(magit-diff-hunk-heading-highlight
     ((t (:background "#404040"
          :foreground ,fg))))

   ;; ------------------------------------------------------------
   ;; Tree-sitter
   ;; ------------------------------------------------------------

   `(treesit-font-lock-comment-face
     ((t (:foreground ,fg-dim
          :slant italic))))

   `(treesit-font-lock-function-call-face
     ((t (:foreground ,peach))))

   `(treesit-font-lock-function-name-face
     ((t (:foreground ,peach))))

   `(treesit-font-lock-keyword-face
     ((t (:foreground ,cyan))))

   `(treesit-font-lock-string-face
     ((t (:foreground ,magenta))))

   `(treesit-font-lock-type-face
     ((t (:foreground ,peach))))

   `(treesit-font-lock-variable-name-face
     ((t (:foreground ,fg))))

   ;; ------------------------------------------------------------
   ;; Which-key
   ;; ------------------------------------------------------------

   `(which-key-key-face
     ((t (:foreground ,cyan))))

   `(which-key-command-description-face
     ((t (:foreground ,fg))))

   `(which-key-group-description-face
     ((t (:foreground ,purple))))

   `(which-key-local-map-description-face
     ((t (:foreground ,peach))))

   ;; ------------------------------------------------------------
   ;; ANSI / compilation
   ;; ------------------------------------------------------------

   `(ansi-color-black
     ((t (:foreground "#242424"
          :background "#242424"))))

   `(ansi-color-red
     ((t (:foreground ,red-bright
          :background ,red-bright))))

   `(ansi-color-green
     ((t (:foreground ,green
          :background ,green))))

   `(ansi-color-yellow
     ((t (:foreground ,orange
          :background ,orange))))

   `(ansi-color-blue
     ((t (:foreground ,blue
          :background ,blue))))

   `(ansi-color-magenta
     ((t (:foreground "#b48ead"
          :background "#b48ead"))))

   `(ansi-color-cyan
     ((t (:foreground ,cyan-alt
          :background ,cyan-alt))))

   `(ansi-color-white
     ((t (:foreground ,fg
          :background ,fg))))

   ;; ------------------------------------------------------------
   ;; Whitespace
   ;; ------------------------------------------------------------

   `(whitespace-space
     ((t (:foreground "#333333"))))

   `(whitespace-tab
     ((t (:foreground "#333333"))))

   `(whitespace-trailing
     ((t (:background "#48212d"))))

   ;; ------------------------------------------------------------
   ;; Tooltip
   ;; ------------------------------------------------------------

   `(tooltip
     ((t (:background ,bg-alt
          :foreground ,fg))))

   ;; ------------------------------------------------------------
   ;; Help
   ;; ------------------------------------------------------------

   `(help-key-binding
     ((t (:background ,bg-highlight
          :foreground ,cyan
          :box (:line-width 1 :color ,border))))))

  ;; ------------------------------------------------------------
  ;; Terminal ANSI colors
  ;; ------------------------------------------------------------

  (custom-theme-set-variables
   'cursor-dark

   `(ansi-color-names-vector
     ["#242424"
      ,red-bright
      ,green
      ,orange
      ,blue
      "#b48ead"
      ,cyan-alt
      ,fg])))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory
                (file-name-directory load-file-name))))

(provide-theme 'cursor-dark)

;;; cursor-dark-theme.el ends here
