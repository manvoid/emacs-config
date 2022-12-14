;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Manuel Lara"
      user-mail-address "malh04@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My personal config

;; Font
(setq! doom-font (font-spec :family "Iosevka" :size 14))
;; (setq! doom-variable-pitch-font (font-spec :family "Helvetica Neue" :size 14))
;; (setq! doom-variable-pitch-font (font-spec :family "Iosevka" :weight 'light :size 14))
;; (setq! doom-variable-pitch-font (font-spec :family "Futura" :weight 'medium :size 14))
;; (setq! doom-variable-pitch-font (font-spec :family "Arial Narrow" :size 14))
;; (setq! doom-font (font-spec :family "Iosevka" :size 14 :weight 'light))
;; (setq! doom-variable-pitch-font (font-spec :family "Helvetica Neue" :size 14 :weight 'light))
;; (setq! doom-font (font-spec :family "Iosevka" :size 14 :weight 'light))
;; (setq! doom-variable-pitch-font (font-spec :family "Optima" :size 14))
;; (setq! doom-font (font-spec :family "Monaco" :size 14))
;; (setq! doom-variable-pitch-font (font-spec :family "Helvetica Neue" :size 14 :weight 'light))
(setq! doom-variable-pitch-font (font-spec :family "Iosevka Aile" :weight 'light :size 14))
;; (setq! doom-variable-pitch-font (font-spec :family "ETBembo" :size 13))
;; (setq! doom-variable-pitch-font (font-spec :inherit doom-font :family "Alegreya" :height .8))

;; Web Mode

(setq! web-mode-content-types-alist
       '(("jsx" . "\\.js[x]?\\'")))

(defun reload-web-mode ()
  (interactive)
  (web-mode)
  (web-mode))

(defun reload-web-mode-config ()
    (local-set-key (kbd "s-r") 'reload-web-mode)
    )

(use-package! web-mode
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-hook! 'web-mode-hook 'reload-web-mode-config)
  :mode "\\.js$"
  )

;; LSP

(use-package! lsp-eslint
  :config
  (setq lsp-eslint-format nil)
  )

;; Miscelaneus

(setq ns-right-alternate-modifier 'none)
(global-set-key (kbd "s-;") 'evil-window-next)
(global-set-key (kbd "s-'") '+workspace:switch-next)
(evil-global-set-key 'normal "gs" 'evil-avy-goto-char-2)
(evil-global-set-key 'visual "gs" 'evil-avy-goto-char-2)
;; (evil-global-set-key 'visual "s-x" 'execute-extended-command)

;; Org mode

(defun reload-org-mode ()
  (interactive)
  (org-mode)
  (org-mode))

(defun reload-org-mode-config ()
    (local-set-key (kbd "s-r") 'reload-org-mode)
    )

(use-package! mixed-pitch
  :hook
  (text-mode . mixed-pitch-mode))

(setq company-global-modes '(not org-mode))
(after! org (setq org-hide-emphasis-markers t))
(add-hook! 'org-mode-hook 'reload-org-mode-config)

(after! org
  (setq org-use-speed-commands
        (lambda ()
          (and (looking-at org-outline-regexp)
               (looking-back "^\**")))))

(add-hook! org-mode (electric-indent-local-mode -1))
(add-hook! org-mode :append #'org-appear-mode)

;; TRAMP

;; (lsp-register-client
;;     (make-lsp-client :new-connection (lsp-tramp-connection "eslint")
;;                      :major-modes '(web-mode)
;;                      :remote? t
;;                      :server-id 'eslint-remote))

;; (use-package-hook! evil
;;   :pre-init
;;   (setq evil-respect-visual-line-mode t) ;; sane j and k behavior
;;   t)
