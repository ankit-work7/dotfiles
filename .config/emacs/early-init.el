;;; early-init.el --- Startup settings -*- lexical-binding: t; -*-

;; Apply before the first graphical frame is created, including new frames
;; opened through emacsclient.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Keep third-party native-compilation diagnostics in the compilation log
;; without opening a warning window.  Normal startup warnings remain enabled.
(setq native-comp-async-report-warnings-errors 'silent)

;;; early-init.el ends here
