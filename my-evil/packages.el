;;; packages.el --- my-evil Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar my-evil-packages
  '(
evil
    ;; package my-evils go here
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar my-evil-excluded-packages '()
  "List of packages to exclude.")

;; (defun add-my-key (key-string action)
;;   (interactive)
;;  (bind-key (key-string . action)))

;; My-keys-minor-mode, to make sure my keys stick out
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defun add-my-key (key-string action)
  (interactive)
  (define-key my-keys-minor-mode-map (kbd key-string) action))
(add-my-key "S-C-<left>" 'enlarge-window-horizontally)
(add-my-key "S-C-<right>" 'shrink-window-horizontally)
(add-my-key "S-C-<down>" 'shrink-window)
(add-my-key "S-C-<up>" 'enlarge-window)
(setq ace-jump-mode-scope 'window)

(defun visit-ansi-term ()
  "If the current buffer is:
       1) a running ansi-term named *ansi-term*, rename it.
       2) a stopped ansi-term, kill it and create a new one.
       3) a non ansi-term, go to an already running ansi-term
          or start a new one while killing a defunt one"
  (interactive)
  (let ((is-term (string= "term-mode" major-mode))
        (is-running (term-check-proc (buffer-name)))
        (term-cmd "/bin/zsh")
        (anon-term (get-buffer "*ansi-term*")))
    (if is-term
        (if is-running
            (if (string= "*ansi-term*" (buffer-name))
                (call-interactively 'rename-buffer)
              (if anon-term
                  (switch-to-buffer "*ansi-term*")
                (ansi-term term-cmd)))
          (kill-buffer (buffer-name))
          (ansi-term term-cmd))
      (if anon-term
          (if (term-check-proc "*ansi-term*")
              (switch-to-buffer "*ansi-term*")
            (kill-buffer "*ansi-term*")
            (ansi-term term-cmd))
        (ansi-term term-cmd)))))

(global-set-key (kbd "<f2>") 'visit-ansi-term)

(defun my-toggle-only-frame ()
  (interactive)
  (if (> (length (window-list (selected-frame) 1)) 1)
      (delete-other-windows) (winner-undo)))
(add-my-key "<f10>" 'my-toggle-only-frame)
