(use-package
 exec-path-from-shell
 :demand t
 :config (exec-path-from-shell-copy-env "SSH_AUTH_SOCK") (exec-path-from-shell-initialize))

(use-package treemacs :demand t)
(elpaca-wait)

(use-package vterm
  :config (add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1)))
  :bind (("C-o" . other-window) ("<f5>" . treemacs)))
(elpaca-wait)

;(use-package eat
;  :config (add-hook 'eat-mode-hook (lambda () (display-line-numbers-mode -1)))
;  :bind (("C-o" . other-window) ("<f5>" . treemacs)))
;(elpaca-wait)

(use-package magit :demand t)

(use-package
 helpful
 :demand t
 :bind
 ("C-h f" . helpful-callable)
 ("C-h v" . helpful-variable)
 ("C-h k" . helpful-key)
 ("C-h F" . helpful-function)
 ("C-h C" . helpful-command))

(use-package company :demand t :config (global-company-mode))
(elpaca-wait)

(use-package lsp-mode
  :demand t
  :commands lsp
  :ensure t
  :diminish lsp-mode
  ;;:hook
  ;;(elixir-ts-mode . lsp)
  )
(elpaca-wait)

(use-package lsp-ui :demand t :commands lsp-ui-mode)
(elpaca-wait)

(use-package lsp-treemacs :demand t :commands lsp-treemacs-errors-list)
(elpaca-wait)

(use-package which-key :demand t :config (which-key-mode))

(use-package smartparens :demand t :hook (prog-mode . smartparens-global-mode))

(use-package rainbow-mode :demand t :diminish rainbow-mode)
(elpaca-wait)
(use-package rainbow-delimiters
  :demand t
  :hook
  (prog-mode . rainbow-delimiters-mode)
  (sly-mrepl-mode . rainbow-delimiters-mode)
  (geiser-repl-mode . rainbow-delimiters-mode))

(use-package paren-face :demand t :config (global-paren-face-mode))

;; Catppuccin Theme
(use-package catppuccin-theme :demand t)
(elpaca-wait)

(load-theme 'catppuccin :no-confirm)

;; Ligatures
(use-package ligature
  :demand t
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  ;; (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;; TODO DEBUG FIXME
(use-package hl-todo
  :demand t
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#FAB387")
          ("FIXME"  . "#F38BA8")
          ("DEBUG"  . "#A6E3A1")))
  (global-hl-todo-mode))


(use-package yasnippet :demand t :diminish yas-minor-mode :config (yas-global-mode 1))
(elpaca-wait)
(use-package yasnippet-snippets :demand t :after (yasnippet))
(elpaca-wait)
(use-package doom-snippets :after yasnippet :ensure (:host github :repo "doomemacs/snippets"))
(elpaca-wait)

(use-package
  haskell-mode
  :demand t)

;; (use-package
;;  elixir-ts-mode
;;  :demand t
;;  :hook (elixir-ts-mode . lsp))
;; (elpaca-wait)

;; (use-package cider :demand t)
;; (elpaca-wait)
;; (use-package
;;   clojure-ts-mode
;;   :demand t
;;   :hook
;;   (clojure-ts-mode . lsp)
;;   (cider-preferred-build-tool . lein))
;; (elpaca-wait)

(use-package nerd-icons :demand t)
(elpaca-wait)

(use-package
 doom-modeline
 :demand t
 :after nerd-icons
 :init (doom-modeline-mode)
 :custom
 (doom-modeline-height 35))

(use-package
  nerd-icons-dired
  :demand t
  :after nerd-icons
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package
  sly
  :demand t
  :after company
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl"))

(use-package
  geiser-guile
  :demand t)
