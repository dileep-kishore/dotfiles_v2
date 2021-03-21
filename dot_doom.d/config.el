;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dileep Kishore"
      user-mail-address "k.dileep1994@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "VictorMono Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "VictorMono Nerd Font") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "FiraCode Nerd Font" :size 15)
      doom-big-font (font-spec :family "VictorMono Nerd Font" :size 20))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic :weight bold))
;; '(font-lock-comment-face ((t (:inherit default :slant italic :family "Victor Mono"))))
;; '(font-lock-constant-face ((t (:slant italic :weight bold :family "Victor Mono"))))
;; '(font-lock-function-name-face ((t (:slant italic :weight bold :family "Victor Mono"))))
;; '(font-lock-keyword-face ((t (:slant italic :weight bold :family "Victor Mono"))))
;; '(font-lock-preprocessor-face ((t (:weight bold :family "Victor Mono"))))
;; '(font-lock-string-face ((t (:slant italic :family "Victor Mono"))))
;; '(hl-todo ((t (:slant italic :weight bold :family "Victor Mono"))))
;; '(info-colors-lisp-code-block ((t (:inherit font-lock-variable-name-face))))
;; '(markdown-code-face ((t (:inherit font-lock-constant-face))))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
