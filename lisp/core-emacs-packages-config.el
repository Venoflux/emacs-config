(use-package
 flyspell
 :demand nil
 :ensure nil
 :config
 (setq
  ispell-program-name "aspell"
  ispell-dictionary "en")
 (add-hook 'text-mode-hook #'flyspell-mode) (add-hook 'prog-mode-hook #'flyspell-prog-mode))

(use-package eldoc :demand nil :ensure nil :diminish eldoc-mode)

(use-package autorevert :demand nil :ensure nil :diminish auto-revert-mode)

(use-package
 dired
 :ensure nil
 :demand nil
 :defer t
 :config
 (setq
  dired-auto-revert-buffer t ; Revert on re-visiting
  ;; Better dired flags:
  ;; `-l' is mandatory
  ;; `-a' shows all files
  ;; `-h' uses human-readable sizes
  ;; `-F' appends file-type classifiers to file names (for better highlighting)
  dired-listing-switches "-laFGh1v --group-directories-first"
  dired-ls-F-marks-symlinks t ; -F marks links with @
  ;; Inhibit prompts for simple recursive operations
  dired-recursive-copies 'always
  ;; Auto-copy to other Dired split window
  dired-dwim-target t)
 :hook (dired-mode . dired-hide-details-mode))

(use-package project :demand nil :ensure nil :bind ("s-f" . project-find-file))

(use-package
 eglot
 :ensure nil
 :demand nil
 ;:config
 ;(add-to-list 'eglot-server-programs '(python-ts-mode "language_server.sh")))
)
