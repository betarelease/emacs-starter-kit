(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

(setq
  ns-command-modifier   'meta       ; Apple/Command key is Meta
  ns-alternate-modifier 'super      ; Option is the Mac Option key
;  ns-use-mac-modifier-symbols  nil  ; display standard Emacs
  )

(load-file "~/.emacs.d/tobys-colors.el")
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
