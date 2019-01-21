;; -*- coding: utf-8 -*-

(make-local-variable 'compile-command)
(setq compile-command (concat (rh-project-get-path) "make src"))

(when (stringp rtags-rdm-includes)
  (setq rtags-rdm-includes '()))

(add-to-list 'rtags-rdm-includes
             (concat
              (directory-file-name
               (expand-file-name (rh-project-get-root)))
              "/src/src/"))
