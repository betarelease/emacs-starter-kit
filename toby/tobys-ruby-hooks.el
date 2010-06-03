(add-hook 'ruby-mode-hook
          (lambda ()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           )))

            (local-set-key (kbd "M-RET") 'textmate-next-line)
            
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)

            (whitespace-mode)
            
            (require 'rsense)
            (require 'rspec-mode)
            (local-set-key (kbd "M-r") 'rspec-verify)
            
            (require 'rvm)
            (rvm-use-default)
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ))

; Install mode-compile to give friendlier compiling support
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key (kbd "C-c c") 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key (kbd "C-c k") 'mode-compile-kill)
(setq mode-compile-save-all-p t)

(provide 'tobys-ruby-hooks)

