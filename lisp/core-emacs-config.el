(use-package
 emacs
 :ensure nil
 :elpaca nil
 :demand nil
 :hook (after-init . (lambda () (setq gc-cons-threshold (* 2 1000 1000))))
 :custom

 ;; Should use:
 (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))
 ;; at least once per installation or while changing this list
 (treesit-language-source-alist
  '((bash "https://github.com/tree-sitter/tree-sitter-bash")
    (heex "https://github.com/phoenixframework/tree-sitter-heex")
    (elixir "https://github.com/elixir-lang/tree-sitter-elixir")
    (clojure "https://github.com/sogaiu/tree-sitter-clojure")))

 (major-mode-remap-alist
  '((bash-mode . bash-ts-mode)
    (elixir-mode . elixir-ts-mode)
    (clojure-mode . clojure-ts-mode)))
 
 :config
 ;; Startup screen and warning light
 (setq inhibit-startup-screen t
       visible-bell nil)

 ;; Turnoff unneeded UI elements
 (menu-bar-mode -1)
 (tool-bar-mode -1)
 (scroll-bar-mode -1)

  ;; Line Numbers
 ;; Enable line numbers globally
 (global-display-line-numbers-mode t)
 (dolist (mode '(org-mode-hook
                 term-mode-hook
                 eshell-mode-hook
		 treemacs-mode-hook
                 dired-mode-hook
                 eat-mode-hook))
   (add-hook mode (lambda () (display-line-numbers-mode 0))))
 
 ;; Highlight line mode
                                        ;(global-hl-line-mode t)

 (blink-cursor-mode t) ;; Blinking cursor mode
 (recentf-mode 1) ;; Remember recently edited files

 ;; Save what you enter into minibuffer prompts
 (setq history-length 25)
 (savehist-mode 1)

 ;; Remember and restore the last cursor location of opened files
 (save-place-mode 1)
 ;; Don't pop up UI dialogs when prompting
 (setq use-dialog-box nil)
 ;; Revert buffers when the underlying file has changed
 (global-auto-revert-mode 1)
 ;; Revert Dired and other buffers
 (setq global-auto-revert-non-file-buffers t)

 ;; Slow Rendering Fonts
 (setq inhibit-compacting-font-caches t)

 ;; Prevent Extraneous Tabs
 (setq-default indent-tabs-mode nil)

 ;; Font
 (add-to-list 'default-frame-alist
              '(font . "Cascadia Code-14"))

 (global-prettify-symbols-mode)

 :bind
 (("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<f5>" . treemacs)
  ("<f6>" . flymake-show-buffer-diagnostics)
  ("<f7>" . eat)
  ("C-o" . other-window)
  ("s-b" . switch-to-buffer)
  ("C-q" . kill-buffer)
  ("S-C-<left>" . shrink-window-horizontally)
  ("S-C-<right>" . enlarge-window-horizontally)
  ("S-C-<down>" . shrink-window)
  ("S-C-<up>" . enlarge-window)))
