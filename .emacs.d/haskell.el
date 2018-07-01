;;; haskell.el --- Haskell configuration
;;; Commentary: This file defines the common hie and haskell-mode settings

;;; Code:
(add-to-list 'load-path "~/.emacs.d/haskell/lsp-haskell")
(add-to-list 'load-path "~/.emacs.d/haskell/lsp-mode")
(add-to-list 'load-path "~/.emacs.d/haskell/lsp-ui")

(require 'company-lsp)
(push 'company-lsp company-backends)

(require 'lsp-ui)
(require 'lsp-haskell)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'haskell-mode-hook #'lsp-haskell-enable)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)
(add-hook 'lsp-mode-hook 'company-mode)

(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

;; module templating
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

;; Rainbow Delimiters
(require 'rainbow-delimiters)
(add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)


(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)))

;; Load cabal repl


;; Compilation steps
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))
;;; haskell.el ends here
