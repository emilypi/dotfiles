;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

;;; Code:
(package-initialize)

;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PATH")

;; includes
(load-file "~/.emacs.d/math.el") ;; --- math keybindings
(load-file "~/.emacs.d/haskell.el") ;; --- all haskell lsp settings
(load-file "~/.emacs.d/utilities.el") ;; --- all basic utilities like flycheck, magit

;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)


;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(background-color "#202020")
 '(background-mode dark)
 '(company-ghc-show-info t)
 '(company-lsp-enable-recompletion t)
 '(company-lsp-enable-snippet nil)
 '(compilation-message-face (quote default))
 '(cursor-color "#cccccc")
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
    ("5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" "a317b11ec40485bf2d2046d2936946e38a5a7440f051f3fcc4cdda27bde6c5d4" "a56a6bf2ecb2ce4fa79ba636d0a5cf81ad9320a988ec4e55441a16d66b0c10e0" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "b97a01622103266c1a26a032567e02d920b2c697ff69d40b7d9956821ab666cc" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "61003d455ba1bad9a3bf8be7342e848ca3febe899319e95a9dc3d804d9697608" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" default)))
 '(fci-rule-color "#073642")
 '(foreground-color "#cccccc")
 '(haskell-process-args-cabal-repl
   (quote
    ("--ghc-options=-ferror-spans -fshow-loaded-modules")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(linum-format " %5i ")
 '(lsp-haskell-process-path-hie "hie-wrapper")
 '(lsp-render-markdown-markup-content 1)
 '(lsp-ui-sideline-enable t)
 '(magit-diff-use-overlays nil)
 '(markdown-enable-math t)
 '(markdown-enable-wiki-links t)
 '(package-selected-packages
   (quote
    (company-lsp subatomic256-theme subatomic-theme planet-theme noctilux-theme molokai-theme farmhouse-theme dracula-theme sublime-themes atom-dark-theme ample-zen-theme ace-window color-theme-sanityinc-solarized exec-path-from-shell shm company-ghc ghc hindent znc haskell-mode rainbow-delimiters prettify-greek focus-autosave-mode rainbow-mode flycheck-cask git-gutter use-package monokai-theme monokai-alt-theme expand-region)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(when
      (or
       (not
        (boundp
         (quote ansi-term-color-vector)))
       (not
        (facep
         (aref ansi-term-color-vector 0))))))
;;; init.el ends here
