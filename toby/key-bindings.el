(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

(setq
  ns-command-modifier   'meta       ; Apple/Command key is Meta
  ns-alternate-modifier 'super      ; Option is the Mac Option key
  ns-pop-up-frames      nil
  )

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-s") 'save-buffer)


(define-key *textmate-mode-map* [(meta shift l)] 'textmate-select-line)

(define-key *textmate-mode-map* [(meta \[)] 'textmate-shift-left)
(define-key *textmate-mode-map* [(meta \])] 'textmate-shift-right)

(define-key *textmate-mode-map* [(super t)] 'peepopen-goto-file-gui)

(provide 'key-bindings)
