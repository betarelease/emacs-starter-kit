(setenv "PATH" (concat "/usr/local/mongodb/bin" ":" "/usr/local/git/bin/" ":" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/git/bin")))

(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))
(require 'textmate)
(textmate-mode)
(require 'peepopen)

(require 'key-bindings)
(require 'ruby-hooks)
(require 'haskell-hooks)

(load-file (concat user-specific-dir "/colors.el"))
(pastels-color-theme)

(require 'column-marker)
(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 80)))


(require 'yasnippet)
(setq yas/trigger-key (kbd "C-c ."))

(yas/initialize)
(yas/load-directory (concat dotfiles-dir "/vendor/yasnippet-0.6.1c/snippets"))
(yas/load-directory (concat dotfiles-dir "/my-snippets"))
(yas/load-directory (concat dotfiles-dir "/vendor/cucumber/snippets"))

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(add-hook 'align-load-hook
          (lambda ()
            (add-to-list 'align-rules-list
                         '(text-column-whitespace
                           (regexp  . "\\(^\\|\\S-\\)\\([ \t]+\\)")
                           (group   . 2)
                           (modes   . align-text-modes)
                           (repeat  . t)))))

(require 'delim-kill)

(defun unicode-insert (char)
  "Read a unicode code point and insert said character.
    Input uses `read-quoted-char-radix'.  If you want to copy
    the values from the Unicode charts, you should set it to 16."
  (interactive (list (read-quoted-char "Char: ")))
  (ucs-insert char))

(require 'real-auto-save)
(add-hook 'text-mode-hook 'turn-on-real-auto-save)
(add-hook 'ruby-mode-hook 'turn-on-real-auto-save)

(setq real-auto-save-interval 5) ;; in seconds

(require 'move-selection)

(load "~/.emacs.d/vendor/twittering-mode/twittering-mode.el")
(require 'twittering-mode)
(setq twittering-username "sudhindraRao")
(setq twittering-icon-mode t)

(require 'ack-emacs)
(require 'ack-in-project)

(setq server-name "toby.emacs")
(server-start)
(add-hook 'after-init-hook 'server-start)

(set-frame-parameter (selected-frame) 'alpha '(90 70))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(require 'ess-site)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'load-path "writegood-mode")
(require 'writegood-mode)
(global-set-key "\C-cg" 'writegood-mode)

