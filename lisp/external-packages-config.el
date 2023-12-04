(use-package
 exec-path-from-shell
 :demand t
 :config (exec-path-from-shell-copy-env "SSH_AUTH_SOCK") (exec-path-from-shell-initialize))

(elpaca-wait)

(use-package treemacs :demand t)
(elpaca-wait)

(use-package eat
  :config (add-hook 'eat-mode-hook (lambda () (display-line-numbers-mode -1)))
  :bind (("C-o" . other-window) ("<f5>" . treemacs)))
(elpaca-wait)

(use-package magit :demand t)
(elpaca-wait)

(use-package
 helpful
 :demand t
 :bind
 ("C-h f" . helpful-callable)
 ("C-h v" . helpful-variable)
 ("C-h k" . helpful-key)
 ("C-h F" . helpful-function)
 ("C-h C" . helpful-command))
(elpaca-wait)

(use-package company :demand t :config (global-company-mode))
(elpaca-wait)

(use-package lsp-mode
  :demand t
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-ts-mode . lsp))
(elpaca-wait)

(use-package lsp-ui :demand t :commands lsp-ui-mode)
(elpaca-wait)

(use-package lsp-treemacs :demand t :commands lsp-treemacs-errors-list)
(elpaca-wait)

(use-package which-key :demand t :config (which-key-mode))
(elpaca-wait)

(use-package smartparens :demand t :hook (prog-mode . smartparens-global-mode))

(use-package rainbow-mode :demand t :diminish rainbow-mode)
(elpaca-wait)
(use-package rainbow-delimiters :demand t :hook (prog-mode . rainbow-delimiters-mode))
(elpaca-wait)

;; Catppuccin Theme
(use-package catppuccin-theme :demand t)
(elpaca-wait)

(load-theme 'catppuccin :no-confirm)

(elpaca-wait)

;; Ligatures
(use-package ligature
  :demand t
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(elpaca-wait)

(use-package yasnippet :demand t :diminish yas-minor-mode :config (yas-global-mode 1))
(elpaca-wait)
(use-package yasnippet-snippets :demand t :after (yasnippet))
(elpaca-wait)
(use-package doom-snippets :after yasnippet :elpaca (:host github :repo "doomemacs/snippets"))
(elpaca-wait)

(use-package
 elixir-ts-mode
 :demand t
 :hook (elixir-ts-mode . lsp))
(elpaca-wait)

(use-package cider :demand t)
(elpaca-wait)
(use-package
  clojure-ts-mode
  :demand t
  :hook
  (clojure-ts-mode . lsp)
  (cider-preferred-build-tool . lein))
(elpaca-wait)

(use-package all-the-icons :demand t :if (display-graphic-p))
(elpaca-wait)

(use-package
 doom-modeline
 :demand t
 :after all-the-icons
 :init (doom-modeline-mode)
 :custom (doom-modeline-height 35))
(elpaca-wait)

(use-package
  all-the-icons-dired
  :demand t
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))
(elpaca-wait)

