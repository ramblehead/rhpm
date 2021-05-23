;; Hey Emacs, this is -*- coding: utf-8 -*-

(require 'hydra)
(require 'cl)

(defvar rh-flatbuffers-dev/make-buffer-name "*rh-flatbuffers-dev/make*")

(defun rh-flatbuffers-dev/make ()
  (interactive)
  (rh-project-compile "make" rh-flatbuffers-dev/make-buffer-name))

(defun rh-flatbuffers-dev/make-reinstall ()
  (interactive)
  (rh-project-compile "make-reinstall" rh-flatbuffers-dev/make-buffer-name))

(defun rh-flatbuffers-dev/cmake ()
  (interactive)
  (rh-project-compile "cmake" rh-flatbuffers-dev/make-buffer-name))

(defun rh-flatbuffers-dev-hydra-define ()
  (defhydra rh-flatbuffers-dev/hydra (:color blue :columns 4)
    "@artizanya/guard project commands"
    ("r" rh-flatbuffers-dev/make-reinstall "make-reinstall")
    ("m" rh-flatbuffers-dev/make "make")
    ("b" rh-flatbuffers-dev/cmake "cmake")))

(rh-flatbuffers-dev-hydra-define)

(define-minor-mode rh-flatbuffers-dev-mode
  "ramblehead flatbuffers-dev minor mode."
  :lighter " rh-flatbuffers-dev"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<f9>") #'rh-flatbuffers-dev/hydra/body)
            map))

(add-to-list 'rm-blacklist " rh-flatbuffers-dev")

(when (featurep 'lsp-mode)
  (defvar rh-flatbuffers-dev/lsp-clients-clangd-args '())
  (setq rh-flatbuffers-dev/lsp-clients-clangd-args
        (copy-sequence lsp-clients-clangd-args))
  (add-to-list
   'rh-flatbuffers-dev/lsp-clients-clangd-args
   "--query-driver=/usr/bin/clang*,/usr/bin/g*-9" t)
  (add-to-list
   'rh-flatbuffers-dev/lsp-clients-clangd-args
   (concat
    "--compile-commands-dir="
    (expand-file-name (concat (rh-project-get-root) "build")))
   t))

(defun rh-flatbuffers-dev-company-capf-c++-local-disable ()
  (when (eq major-mode 'c++-mode)
    (setq-local company-backends
                (remq 'company-capf company-backends))))

(defun rh-flatbuffers-dev-setup ()
  (when buffer-file-name
    (let* ((project-root (rh-project-get-root))
           (project-path (rh-project-get-path))
           file-rpath)
      (when project-root
        (setq file-rpath (file-relative-name buffer-file-name project-root))
        (cond
         ;; ((string-match-p "\\.ts\\'\\|\\.tsx\\'" file-rpath)
         ;;  (setq-local tide-tsserver-executable
         ;;              (concat project-root "web/node_modules/.bin/tsserver"))
         ;;  (setq-local flycheck-javascript-eslint-executable
         ;;              (concat project-root "web/node_modules/.bin/eslint"))
         ;;  (setq-local compile-command (concat project-path "make-web"))
         ;;  (rh-setup-typescript-tide))

         ((eq major-mode 'c++-mode)
          ;; (when (boundp 'lsp-mode)
          ;;   (setq-local lsp-clients-clangd-args
          ;;               rh-flatbuffers-dev/lsp-clients-clangd-args)
          ;;   (lsp)
          ;;   (setq-local company-backends
          ;;               '(company-capf company-files
          ;;                 (company-dabbrev company-ispell)))
          ;;   (setq-local flycheck-check-syntax-automatically
          ;;               '(save idle-change mode-enabled))
          ;;   ;; (bind-key "C-<tab>" #'company-capf c-mode-base-map)
          ;;   )
          (when (rh-clangd-executable-find)
            (when (featurep 'lsp-mode)
              (setq-local lsp-clients-clangd-args
                          rh-flatbuffers-dev/lsp-clients-clangd-args)
              (setq-local lsp-modeline-diagnostics-enable nil)
              (lsp)
              (lsp-headerline-breadcrumb-mode 1)
              (setq-local flycheck-idle-change-delay 3)
              (setq-local flycheck-check-syntax-automatically
                          ;; '(save mode-enabled)
                          '(save mode-enabled idle-change))
              (add-hook
               'lsp-after-open-hook
               #'rh-flatbuffers-dev-company-capf-c++-local-disable)

              (add-hook
               'lsp-after-initialize-hook
               #'rh-flatbuffers-dev-company-capf-c++-local-disable)))

          (company-mode 1)
          ;; (rh-rtags-mode 1)

          (setq-local compile-command (concat project-path "make-server"))))))))
