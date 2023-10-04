(setq user-full-name "Ebert Charles Matthee")
(setq user-mail-address "ebert@ecmatthee.com")

(require 'leaf)
(leaf leaf-keywords
      ;;:init
      ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
      ;;(leaf hydra :ensure t)
      ;;(leaf el-get :ensure t)
      ;;(leaf blackout :ensure t)

      :config
      (leaf-keywords-init))

(require 'nerd-icons)
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Show dashboard in frames created with emacsclient -c
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(setq dashboard-banner-logo-title "Welcome to Emacs")
(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)

(setq dashboard-display-icons-p t)
(setq dashboard-icon-type 'nerd-icons)
;; https://github.com/emacs-dashboard/emacs-dashboard/issues/459
(setq dashboard-set-heading-icons nil)
(setq dashboard-set-file-icons t)
(setq dashboard-set-init-info t)

;; Change the user-emacs-directory to keep unwanted things out of ~/.emacs.d
;;(setq user-emacs-directory (expand-file-name "~/.cache/emacs/"))
;;(setq url-history-file (expand-file-name "url/history" user-emacs-directory))

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(set-default-coding-systems 'utf-8)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

(column-number-mode)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq display-line-numbers-grow-only t)

(setq history-length 25)
(savehist-mode 1)
(recentf-mode 1) ; Remember file history

(which-key-mode)

(leaf vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

(leaf marginalia
      ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
      ;; available in the *Completions* buffer, add it to the
      ;; `completion-list-mode-map'.
      :bind (:minibuffer-local-map
		  ("M-A" . marginalia-cycle))
      :init
      (marginalia-mode))

(setq completion-cycle-threshold 3)
(setq tab-always-indent 'complete)

(leaf corfu
  :bind
  (:corfu-map ("SPC" . corfu-insert-separator))
  :init
  (global-corfu-mode))
(advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)

(leaf cape
  :bind (("C-c p p" . completion-at-point) ;; capf
	 ("C-c p t" . complete-tag)        ;; etags
	 ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
	 ("C-c p h" . cape-history)
	 ("C-c p f" . cape-file)
	 ("C-c p k" . cape-keyword)
	 ("C-c p s" . cape-elisp-symbol)
	 ("C-c p e" . cape-elisp-block)
	 ("C-c p a" . cape-abbrev)
	 ("C-c p l" . cape-line)
	 ("C-c p w" . cape-dict)
	 ("C-c p :" . cape-emoji)
	 ("C-c p \\" . cape-tex)
	 ("C-c p _" . cape-tex)
	 ("C-c p ^" . cape-tex)
	 ("C-c p &" . cape-sgml)
	 ("C-c p r" . cape-rfc1345))
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-elisp-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
  )

(leaf orderless
  :custom
  (completion-styles . '(orderless basic))
  (completion-category-overrides . '((file (styles basic partial-completion)))))

(yas-global-mode 1)

(windmove-default-keybindings)
(defalias 'yes-or-no #'y-or-n-p)

(defun meow-setup ()
(setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
(meow-motion-overwrite-define-key
 '("j" . meow-next)
 '("k" . meow-prev)
 '("<escape>" . ignore))
(meow-leader-define-key
 ;; SPC j/k will run the original command in MOTION state.
 '("j" . "H-j")
 '("k" . "H-k")
 ;; Use SPC (0-9) for digit arguments.
 '("1" . meow-digit-argument)
 '("2" . meow-digit-argument)
 '("3" . meow-digit-argument)
 '("4" . meow-digit-argument)
 '("5" . meow-digit-argument)
 '("6" . meow-digit-argument)
 '("7" . meow-digit-argument)
 '("8" . meow-digit-argument)
 '("9" . meow-digit-argument)
 '("0" . meow-digit-argument)
 '("/" . meow-keypad-describe-key)
 '("?" . meow-cheatsheet))
(meow-normal-define-key
 '("0" . meow-expand-0)
 '("9" . meow-expand-9)
 '("8" . meow-expand-8)
 '("7" . meow-expand-7)
 '("6" . meow-expand-6)
 '("5" . meow-expand-5)
 '("4" . meow-expand-4)
 '("3" . meow-expand-3)
 '("2" . meow-expand-2)
 '("1" . meow-expand-1)
 '("-" . negative-argument)
 '(";" . meow-reverse)
 '("," . meow-inner-of-thing)
 '("." . meow-bounds-of-thing)
 '("[" . meow-beginning-of-thing)
 '("]" . meow-end-of-thing)
 '("a" . meow-append)
 '("A" . meow-open-below)
 '("b" . meow-back-word)
 '("B" . meow-back-symbol)
 '("c" . meow-change)
 '("d" . meow-delete)
 '("D" . meow-backward-delete)
 '("e" . meow-next-word)
 '("E" . meow-next-symbol)
 '("f" . meow-find)
 '("g" . meow-cancel-selection)
 '("G" . meow-grab)
 '("h" . meow-left)
 '("H" . meow-left-expand)
 '("i" . meow-insert)
 '("I" . meow-open-above)
 '("j" . meow-next)
 '("J" . meow-next-expand)
 '("k" . meow-prev)
 '("K" . meow-prev-expand)
 '("l" . meow-right)
 '("L" . meow-right-expand)
 '("m" . meow-join)
 '("n" . meow-search)
 '("o" . meow-block)
 '("O" . meow-to-block)
 '("p" . meow-yank)
 '("q" . meow-quit)
 '("Q" . meow-goto-line)
 '("r" . meow-replace)
 '("R" . meow-swap-grab)
 '("s" . meow-kill)
 '("t" . meow-till)
 '("u" . meow-undo)
 '("U" . meow-undo-in-selection)
 '("v" . meow-visit)
 '("w" . meow-mark-word)
 '("W" . meow-mark-symbol)
 '("x" . meow-line)
 '("X" . meow-goto-line)
 '("y" . meow-save)
 '("Y" . meow-sync-grab)
 '("z" . meow-pop-selection)
 '("'" . repeat)
 '("<escape>" . ignore)))

(require 'meow)
(meow-setup)
(meow-global-mode 1)

(setq indent-tabs-mode nil)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1)

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook 'eglot-ensure)



(load-theme 'modus-vivendi t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(setq visible-bell t)

(setq use-dialog-box nil)

(set-fringe-mode 0)



(setq org-startup-folded t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (lisp . t)
   (python . t)))

(push '("conf-unix" . conf-unix) org-src-lang-modes)

(setq org-confirm-babel-evaluate t)

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

(dirvish-override-dired-mode)
