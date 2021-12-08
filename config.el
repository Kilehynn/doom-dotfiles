;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Mexane Delcroix"
      user-mail-address "mexane.delcroix@epita.fr")

;; Doom exposes five (optional) variables for controllingrfonts in Doom. Here
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
;;       doom-variable-pitch-https://github.com/hlissner/doom-emacs font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-moonlight)
(setq doom-font (font-spec :family "Fira Code" :size 20))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(after! org
  (setq
   org-log-into-drawer'LOGBOOK
   org-log-done 'time
   org-todo-keywords
   '((sequence "TODO(t)" "WAIT(w)" "INPROGRESS(i)" "|" "DONE(d)")
     (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
     (sequence "|" "CANCELED(c)"))
   org-todo-keyword-faces
   '(("TODO" :foreground "#FFE5B4" :weight "bold")
     ("WAIT" :foreground "#FF985A" :weight "bold")
     ("INPROGRESS" :foreground "#3EB489" :weight "bold")
     ("DONE" :foreground "#77DD77" :weight "bold")
     ("REPORT" :foreground "#FFA91A" :weight "bold")
     ("BUG" :foreground "#ED1C24" :weight "bold")
     ("KNOWNCAUSE" :foreground "#D291BC" :weight "bold")
     ("FIXED" :foreground "#C1E7E3" :weight "bold")
     ("CANCELED" :foreground "#607D8B" :weight "bold"))))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories :o the `load-path', relative to
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
(setq x-select-enable-clipboard-manager nil)
(setq org-support-shift-select t)

(use-package! org-pandoc-import :after org)
(use-package! org-roam
  :after org
  :ensure t
  :custom
  (org-roam-directory "~/RoamNotes")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))


(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
