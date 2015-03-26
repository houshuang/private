;;; packages.el --- keychord Layer packages File for Spacemacs
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

(defvar keychord-packages
  '(
    key-chord
    )

  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar keychord-excluded-packages '()
  "List of packages to exclude.")
(defun window-number-list ()
  "Returns a list of the windows, in fixed order and the
minibuffer (even if not active) last."
  (let* ((walk-windows-start
          (car (set-difference
                (window-list (selected-frame) t)
                (window-list (selected-frame) 1))))
         (walk-windows-current walk-windows-start)
         list)
    (while (progn
             (setq walk-windows-current
                   (next-window walk-windows-current t))
             (setq list (cons walk-windows-current list))
             (not (eq walk-windows-current walk-windows-start))))
    (reverse (cons (car list) (cdr list)))))

(defun window-number-select (number)
  "Selects the nth window."
  (interactive "P")
  (if (integerp number)
      (let ((window (nth (1- number) (window-number-list))))
        (if (and window (or (not (window-minibuffer-p window))
                            (minibuffer-window-active-p window)))
            (select-window window)
          (error "No such window.")))))

(defun my-switch-window ()
  (interactive)
  (if (= 2 (length (window-list)))
      (other-window 1)
  (window-number-select (string-to-number (char-to-string ( read-char))))))

(defun keychord-init ()
(package-activate 'key-chord)
  (use-package key-chord
:demand
:config
(key-chord-define global-map "qw" 'my-switch-window)
(key-chord-define global-map "m," 'helm-recentf)
(key-chord-define global-map ",." 'evil-buffer)
(key-chord-define global-map "nm" 'switch-to-buffer)
(key-chord-define global-map "90" 'winner-undo)
(key-chord-define global-map "-0" 'winner-redo)
(key-chord-define global-map "12" nil)
(key-chord-define global-map "[]" 'helm-M-x)
(key-chord-define global-map "zx" [escape])
(key-chord-define global-map "ii" (lambda () (interactive) (insert "I")))
(key-chord-mode 1)
))
(keychord-init)
