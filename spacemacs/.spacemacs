;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ruby
     (c-c++ :variables c-c++-enable-clang-support t)
     yaml
     csv
     haskell
     html
     javascript
     ivy
     auto-completion
     ;; better-defaults
     emacs-lisp
     python
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     ;; semantic
     neotree
     debug

     ;; User Layers
     ;;happy-mode
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     vimish-fold
     visual-fill-column
     platformio-mode
     dts-mode

     ;; RealGUD debugger support
     realgud
     realgud-ipdb
    )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; Example for 5 recent files and 7 projects: '((recents . 5) (projects . 7))
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; (default nil)
   dotspacemacs-startup-lists '()
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(ample
                         ample-zen
                         badwolf
                         dakrone
                         tsdh-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Consolas"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
   ;;(set-face-attribute 'default nil :family "Inconsolata")
   ;;(set-face-attribute 'default nil :height 130)
   ;;(add-to-list 'custom-theme-load-path "~.emacs.d/themes/")

  (setq-default tab-width 4)
  (setq-default fill-column 100)
  (setq-default python-fill-column 100)
  (setq-default visual-fill-column-center-text t)
  (setq-default visual-fill-column-width 100)

  ;; Disable smartparens matching for most pairs
  ;;(eval-after-load 'smartparens
  ;;  '(progn
  ;;     (sp-pair "(" nil :actions :rem)
  ;;     (sp-pair "[" nil :actions :rem)
  ;;     (sp-pair "{" nil :actions :rem)
  ;;     (sp-pair "`" nil :actions :rem)
  ;;     (sp-pair "'" nil :actions :rem)
  ;;     (sp-pair "\"" nil :actions :rem)))

  (remove-hook 'prog-mode-hook #'smartparens-mode)
  (spacemacs/toggle-smartparens-globally-off)

  (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

  ;; Nice ReST view
  (add-hook 'rst-mode-hook
            (lambda ()
              (spacemacs/toggle-line-numbers-off)
              (turn-on-visual-line-mode)))

  ;; Nice markdown view
  (add-hook 'markdown-mode-hook
            (lambda ()
              (spacemacs/toggle-line-numbers-off)
              (turn-on-visual-line-mode)))

  ;; Nice Org Mode view
  (add-hook 'org-mode-hook
            (lambda ()
              (spacemacs/toggle-line-numbers-off)
              (turn-on-visual-line-mode)))

  ;; Make underscores part of a word in Python
  (add-hook 'python-mode-hook
            (lambda ()
              (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

  ;; Get Python docstring indentation to work
  (defun my-python-noindent-docstring (&optional _previous)
    (if (eq (car (python-indent-context)) :inside-docstring)
            'noindent))

  (advice-add 'python-indent-line :before-until #'my-python-noindent-docstring)

  (add-hook 'org-mode-hook
            (lambda ()
              (toggle-word-wrap)
              (toggle-truncate-lines)
              (evil-define-key 'normal org-mode-map "o" 'org-insert-heading-after-current)))

  (with-eval-after-load 'neotree
    (setq-default neo-show-hidden-files nil)
    (add-to-list 'neo-hidden-regexp-list "__pycache__")
    )

  (define-key evil-motion-state-map "H" 'sp-previous-sexp)
  (define-key evil-motion-state-map "L" 'sp-next-sexp)
  (define-key evil-insert-state-map "\M-H" 'sp-forward-barf-sexp)
  (define-key evil-insert-state-map "\M-L" 'sp-forward-slurp-sexp)

  (define-key evil-normal-state-map "\C-n" 'evil-next-buffer)
  (define-key evil-normal-state-map "\C-p" 'evil-prev-buffer)

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map "\C-j" (lambda () (interactive) (evil-scroll-line-down 10)))
  (define-key evil-normal-state-map "\C-k" (lambda () (interactive) (evil-scroll-line-up 10)))
  (define-key evil-normal-state-map "J" (lambda () (interactive) (evil-next-visual-line 10)))
  (define-key evil-normal-state-map "K" (lambda () (interactive) (evil-previous-visual-line 10)))

  (define-fringe-bitmap 'right-curly-arrow
    [#b00000000
     #b00000000
     #b00000000
     #b00000000
     #b01110000
     #b00010000
     #b00010000
     #b00000000])
  (define-fringe-bitmap 'left-curly-arrow
    [#b00000000
     #b01000000
     #b01000000
     #b01110000
     #b00000000
     #b00000000
     #b00000000
     #b00000000])

  ;; Tab-substitution of latex chars
  (defvar latex-lookup-table
    '(("\\alpha" . "α")
      ("\\beta" . "β")
      ("\\gamma" . "γ")
      ("\\delta" . "δ")
      ("\\epsilon" . "ε")
      ("\\zeta" . "ζ")
      ("\\eta" . "η")
      ("\\theta" . "θ")
      ("\\iota" . "ι")
      ("\\kappa" . "κ")
      ("\\lambda" . "λ")
      ("\\mu" . "μ")
      ("\\nu" . "ν")
      ("\\omicron" . "ο")
      ("\\pi" . "π")
      ("\\rho" . "ρ")
      ("\\sigma" . "σ")
      ("\\tau" . "τ")
      ("\\upsilon" . "υ")
      ("\\phi" . "φ")
      ("\\chi" . "χ")
      ("\\psi" . "ψ")
      ("\\omega" . "ω")

      ("\\Alpha" . "Α")
      ("\\Beta" . "Β")
      ("\\Gamma" . "Γ")
      ("\\Delta" . "Δ")
      ("\\Epsilon" . "Ε")
      ("\\Zeta" . "Ζ")
      ("\\Eta" . "Η")
      ("\\Theta" . "θ")
      ("\\Iota" . "Ι")
      ("\\Kappa" . "Κ")
      ("\\Lambda" . "Λ")
      ("\\Mu" . "Μ")
      ("\\Nu" . "Ν")
      ("\\Omicron" . "Ο")
      ("\\Pi" . "Π")
      ("\\Rho" . "Ρ")
      ("\\Sigma" . "Σ")
      ("\\Tau" . "Τ")
      ("\\Upsilon" . "Υ")
      ("\\Phi" . "Φ")
      ("\\Chi" . "Χ")
      ("\\Psi" . "Ψ")
      ("\\Omega" . "Ω")

      ("\\deg" . "°")
      ))

  (defun replace-latex-char ()
    "Replace select latex codes with their corresponding unicode chars."
    (interactive)
    (if-let
      ((end (point))
       (start (save-excursion
                (search-backward "\\" (save-excursion (forward-whitespace -1) (point)) t)))
       (new-str (cdr (assoc (buffer-substring start end) latex-lookup-table))))

      (progn
        (delete-region start end)
        (insert new-str))))

  ;;(define-key evil-insert-state-map [tab] 'replace-latex-char)
  )

   ;;

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#504545" "#ad8572" "#a9df90" "#aaca86" "#91a0b3" "#ab85a3" "#afcfef" "#bdbdb3"])
 '(c-basic-offset 4)
 '(c-offsets-alist (quote ((case-label . *))))
 '(disaster-objdump "avr-objdump -d -M att -Sl --no-show-raw-insn")
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#424242" t)
 '(fill-column 999999)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-ghc-args (quote ("-dynamic")))
 '(flycheck-pos-tip-timeout 3600)
 '(global-evil-search-highlight-persist t)
 '(global-origami-mode t)
 '(mouse-wheel-scroll-amount (quote (2 ((shift) . 1) ((control)))))
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(origami-mode-hook (quote (origami-mode-set-explicitly)))
 '(origami-show-fold-header t)
 '(package-selected-packages
   (quote
    (rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby transient lv org-mime parent-mode flx treepy graphql epl winum org-category-capture fuzzy ghub let-alist f goto-chg undo-tree s visual-fill-column hide-comnt packed avy evil disaster company-c-headers cmake-mode clang-format stickyfunc-enhance srefactor platformio-mode yaml-mode csv-mode intero flycheck-haskell company-ghci company-ghc ghc hlint-refactor hindent haskell-snippets haskell-mode company-cabal cmm-mode vimish-fold xterm-color shell-pop multi-term flyspell-correct-ivy flyspell-correct eshell-z eshell-prompt-extras esh-help auto-dictionary smeargle orgit magit-gitflow gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor wgrep smex ivy-hydra counsel-projectile counsel swiper ivy origami dakrone-theme badwolf-theme ample-zen-theme web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode org-projectile org-present org org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc markdown-mode htmlize gnuplot gh-md flycheck-pos-tip pos-tip flycheck helm-company helm-c-yasnippet company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic color-theme-sanityinc-tomorrow which-key use-package spaceline powerline restart-emacs request persp-mode pcre2el paradox spinner org-plus-contrib open-junk-file neotree macrostep info+ indent-guide hydra hungry-delete hl-todo helm-make helm-ag google-translate eyebrowse expand-region evil-surround evil-nerd-commenter evil-mc evil-matchit dumb-jump column-enforce-mode aggressive-indent ace-window ace-link anzu iedit smartparens bind-map highlight dash projectile helm helm-core async spacemacs-theme ws-butler window-numbering volatile-highlights vi-tilde-fringe uuidgen toc-org rainbow-delimiters quelpa popwin popup pkg-info org-bullets move-text lorem-ipsum linum-relative link-hint ido-vertical-mode highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds golden-ratio flx-ido fill-column-indicator fancy-battery exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav diminish define-word clean-aindent-mode bind-key auto-highlight-symbol auto-compile adaptive-wrap ace-jump-helm-line)))
 '(scroll-margin 10)
 '(tramp-completion-reread-directory-timeout nil nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil)
 '(visual-fill-column-center-text t)
 '(visual-fill-column-width 100))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#bdbdb3" :background "gray13"))))
 '(origami-fold-fringe-face ((t (:background "gray20"))))
 '(origami-fold-header-face ((t (:background "gray16" :box (:line-width 1 :color "gray19"))))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#504545" "#ad8572" "#a9df90" "#aaca86" "#91a0b3" "#ab85a3" "#afcfef" "#bdbdb3"])
 '(c-basic-offset 4)
 '(c-offsets-alist (quote ((case-label . *))))
 '(disaster-objdump "avr-objdump -d -M att -Sl --no-show-raw-insn")
 '(electric-indent-mode nil)
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#424242")
 '(fill-column 999999)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-checker-error-threshold 2000)
 '(flycheck-ghc-args (quote ("-dynamic")))
 '(flycheck-pos-tip-timeout 3600)
 '(global-evil-search-highlight-persist t)
 '(global-origami-mode t)
 '(mouse-wheel-scroll-amount (quote (2 ((shift) . 1) ((control)))))
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(origami-mode-hook (quote (origami-mode-set-explicitly)))
 '(origami-show-fold-header t)
 '(package-selected-packages
   (quote
    (realgud-ipdb rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby transient lv org-mime parent-mode flx treepy graphql epl winum org-category-capture fuzzy ghub let-alist f goto-chg undo-tree s visual-fill-column hide-comnt packed avy evil disaster company-c-headers cmake-mode clang-format stickyfunc-enhance srefactor platformio-mode yaml-mode csv-mode intero flycheck-haskell company-ghci company-ghc ghc hlint-refactor hindent haskell-snippets haskell-mode company-cabal cmm-mode vimish-fold xterm-color shell-pop multi-term flyspell-correct-ivy flyspell-correct eshell-z eshell-prompt-extras esh-help auto-dictionary smeargle orgit magit-gitflow gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor wgrep smex ivy-hydra counsel-projectile counsel swiper ivy origami dakrone-theme badwolf-theme ample-zen-theme web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode org-projectile org-present org org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc markdown-mode htmlize gnuplot gh-md flycheck-pos-tip pos-tip flycheck helm-company helm-c-yasnippet company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic color-theme-sanityinc-tomorrow which-key use-package spaceline powerline restart-emacs request persp-mode pcre2el paradox spinner org-plus-contrib open-junk-file neotree macrostep info+ indent-guide hydra hungry-delete hl-todo helm-make helm-ag google-translate eyebrowse expand-region evil-surround evil-nerd-commenter evil-mc evil-matchit dumb-jump column-enforce-mode aggressive-indent ace-window ace-link anzu iedit smartparens bind-map highlight dash projectile helm helm-core async spacemacs-theme ws-butler window-numbering volatile-highlights vi-tilde-fringe uuidgen toc-org rainbow-delimiters quelpa popwin popup pkg-info org-bullets move-text lorem-ipsum linum-relative link-hint ido-vertical-mode highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds golden-ratio flx-ido fill-column-indicator fancy-battery exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav diminish define-word clean-aindent-mode bind-key auto-highlight-symbol auto-compile adaptive-wrap ace-jump-helm-line)))
 '(safe-local-variable-values
   (quote
    ((javascript-backend . tern)
     (javascript-backend . lsp)
     (flycheck-python-flake8-executable . "python2"))))
 '(scroll-margin 10)
 '(tramp-completion-reread-directory-timeout nil nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil)
 '(visual-fill-column-center-text t)
 '(visual-fill-column-width 100))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#bdbdb3" :background "gray13"))))
 '(origami-fold-fringe-face ((t (:background "gray20"))))
 '(origami-fold-header-face ((t (:background "gray16" :box (:line-width 1 :color "gray19"))))))
)
