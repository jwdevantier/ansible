;;Define QEMU Style
(defconst qemu-c-style
  '((indent-tabs-mode . nil)
    (c-basic-offset . 4)
    (tab-width . 8)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist . ((substatement-open before after)))
    (c-offsets-alist . ((statement-block-intro . +)
                        (substatement-open . 0)
                        (label . 0)
                        (statement-cont . +)
                        (innamespace . 0)
                        (inline-open . 0)
                        ))
    (c-hanging-braces-alist .
                            ((brace-list-open)
                             (brace-list-intro)
                             (brace-list-entry)
                             (brace-list-close)
                             (brace-entry-open)
                             (block-close . c-snug-do-while)
                             ;; structs have hanging braces on open
                             (class-open . (after))
                             ;; ditto if statements
                             (substatement-open . (after))
                             ;; and no auto newline at the end
                             (class-close)
                             ))
    )
  "QEMU C Programming Style"
)
;;Add QEMU style
(c-add-style "qemu" qemu-c-style)

;Install hook to activate Linux Kernel style when in 'mb-lightnvm'
(add-hook 'c-mode-hook
  (lambda ()
    (let ((filename (buffer-file-name)))
      ;; Enable kernel mode for the appropriate files
      (when (and filename (string-match (expand-file-name "~/repos/mb-lightnvm") filename))
        (setq indent-tabs-mode t)
        (c-set-style "linux-tabs-only")
	(message "Linux kernel C style activated")
      )
    )
  )
)

;;Install hook to activate QEMU style when in 'qemu-nvme'
(add-hook 'c-mode-hook
  (lambda ()
    (let ((filename (buffer-file-name)))
      ;;enable qemu-style for qemu repo
      (when (and filename (string-match (expand-file-name "~/repos/qemu-nvme") filename))
	(setq indent-tabs-mode f)
	(c-set-style "qemu")
	(message "QEMU C style activated")
      )
    )
  )
)

(provide 'c-indent-qemu)
