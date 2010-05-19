(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

(setq
  ns-command-modifier   'meta       ; Apple/Command key is Meta
  ns-alternate-modifier 'super      ; Option is the Mac Option key
;  ns-use-mac-modifier-symbols  nil  ; display standard Emacs
  )

(load-file (concat dotfiles-dir "/tobys-colors.el"))
(my-color-theme)

(setenv "PATH" (concat "/usr/local/git/bin/" ":" (getenv "PATH")))

(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(require 'column-marker)
(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 80)))

(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet-0.6.1c"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "/vendor/yasnippet-0.6.1c/snippets"))

(add-to-list 'load-path (concat dotfiles-dir "/vendor/textmate"))
(require 'textmate)
(textmate-mode)

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(setq rsense-home (concat dotfiles-dir "/vendor/rsense"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/auto-complete-1.2"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

