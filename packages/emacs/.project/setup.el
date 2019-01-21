;; -*- coding: utf-8 -*-

(when (stringp rtags-rdm-includes)
  (setq rtags-rdm-includes '()))

(add-to-list 'rtags-rdm-includes
             (concat
              (directory-file-name
               (expand-file-name (rh-project-get-root)))
              "/src/src/"))

;; (expand-file-name  (rh-project-get-root))

;; (let ((project-root (rh-project-get-root))
;;       file-rpath)
;;   (when project-root
;;     (setq file-rpath (file-relative-name buffer-file-name project-root))
;;     (cond ((string-match-p "\\.css\\'" file-rpath)
;;            (rh-setup-css-skewer)))))
