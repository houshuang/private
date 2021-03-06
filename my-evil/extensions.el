;;; extensions.el --- my-evil Layer extensions File for Spacemacs
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

(defvar my-evil-pre-extensions
  '(
    ;; pre extension my-evils go here
    )
  "List of all extensions to load before the packages.")

(defvar my-evil-post-extensions
  '(
    ;; post extension my-evils go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function my-evil/init-<extension-my-evil>
;;
;; (defun my-evil/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
