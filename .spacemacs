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
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     (git :variables
          git-gutter-use-fringe t
          git-enable-github-support t)
     (markdown :variables markdown-live-preview-engine 'vmd)
     org
     syntax-checking
     osx
     ;; python
     (python :variables python-enable-yapf-format-on-save t)
     ;; obipython
     rust
     lua
     csv
     html
     javascript
     extra-langs
     emacs-lisp
     shell
     dash
     (colors :variables colors-enable-rainbow-identifiers t)
     ox-jekyll
     fasd
     xkcd
     (chinese :variables
              chinese-enable-youdao-dict t)
     themes-megapack
     yaml
     graphviz
     (spell-checking :variables spell-checking-enable-by-default nil)
     ;ipython-notebook
     common-lisp
     (keyboard-layout :variables
                      kl-layout 'norman
                      kl-disabled-configurations '(org magit)
                      )
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
    ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
  ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ob-ipython
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
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         leuven
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 14
                               :weight normal
                               :width normal
                               :slant normal
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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
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
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
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
   frame-resize-pixelwise t
   dotspacemacs-maximized-at-startup t
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
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
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
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
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

  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|10.*\\|127.0.0.1\\)")
        ("http" . "127.0.0.1:6152")
        ("https" . "127.0.0.1:6152")))

  ;; (global-linum-mode)
  ;; (electric-indent-mode 1)
  (global-hl-line-mode -1)
  (setq flycheck-indication-mode nil)
  (setq exec-path (append exec-path '("/usr/local/bin" "/usr/texbin")))
  (setenv "PYTHONPATH" (substitute-in-file-name "$HOME/src/quant/lib"))
  (setenv "LANG" "en_US.UTF-8")
  (setenv "LC_ALL" "en_US.UTF-8")
  (setenv "LC_CTYPE" "en_US.UTF-8")
  (set-default 'truncate-lines t)
  (setq-default line-spacing 5)
  ;; scrolling
  (setq mouse-wheel-scroll-amount '(2 ((shift) . 1) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil)
  ;; Tab settings
  (setq-default tab-width 4 indent-tabs-mode nil)
  (setq-default c-basic-offset 4 c-default-style "bsd")
  (setq indent-tabs-mode nil)
  (setq-default lua-indent-level 2)
  ;; Whitespace settings
  (setq whitespace-action '(auto-cleanup))
  (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
  ;; org mode
  (setq org-confirm-babel-evaluate nil)
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  (setq org-directory (substitute-in-file-name "$HOME/src/org/"))
  (setq org-log-done 'time)
  (setq org-activate-links '(bracket angle radio tag date footnote))
  ;; yasnippet
  ;; (yas-reload-all)
  ;; some additional packages
  (require 'ob-ipython)
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  (setq org-confirm-babel-evaluate nil)

  ; CJK font settings
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family "STKaiti" :size 16)))
  (setq face-font-rescale-alist '(("STKaiti" . 1.15) ("STKaiti" . 1.15)))
  ;; Org publish settings
  (setq org-jekyll/jekyll-project-root "~/src/semio.github.io/")
  (setq org-jekyll/org-mode-project-root "~/src/org/blog/")
  (setq org-jekyll/org-mode-static-files-folder-name "assets")
  (setq org-jekyll/jekyll-static-folder-name "assets")
  ;; Org tasks
  (setq org-todo-keywords
        '((sequence "TODO" "PROGRESS" "WAITING" "DONE")))
  ;; org templates
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/src/org/todo.org" "Todos")
           "* TODO  %?\n  %i\n  %a")
          ("d" "diary" entry (file+datetree "~/src/org/diary.org")
           "*  %?\n")
          ("i" "Inbox" entry (file+headline "~/src/org/todo.org" "Inbox")
           "* %^{Title}\n\n  Source: %u, %c\n\n  %i"
           :empty-lines 1)
          )
        )
  ;;;; footnotes
  (setq org-html-footnotes-section "<!-- %s --><div class=\"footnotes\">
<hr>
<div id=\"text-footnotes\">
%s
</div>
</div>")
  ;; rainbow colors
  (setq rainbow-identifiers-faces-to-override
        '(font-lock-type-face
          font-lock-variable-name-face
          font-lock-function-name-face))
  (setq rainbow-identifiers-choose-face-function
        'rainbow-identifiers-cie-l*a*b*-choose-face)
  (setq rainbow-identifiers-cie-l*a*b*-lightness 30)
  (setq rainbow-identifiers-cie-l*a*b*-saturation 100)

  ;; roswell
  (load (expand-file-name "~/.roswell/helper.el"))
  (setf slime-lisp-implementations
        `((sbcl    ("sbcl" "--dynamic-space-size" "2000"))
          (roswell ("ros" "-L" "sbcl" "-Q" "-l" "~/.sbclrc run"))))
  (setf slime-default-lisp 'roswell)

    ;; rust racer
  (setenv "RUST_SRC_PATH" (expand-file-name "src/rust/rust/src"))

  ;; font lagitures
  ;; (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
  ;;              (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
  ;;              (36 . ".\\(?:>\\)")
  ;;              (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
  ;;              (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
  ;;              (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
  ;;              (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
  ;;              ;; (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
  ;;              ;; (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
  ;;              ;; (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
  ;;              (48 . ".\\(?:x[a-zA-Z]\\)")
  ;;              (58 . ".\\(?:::\\|[:=]\\)")
  ;;              (59 . ".\\(?:;;\\|;\\)")
  ;;              (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
  ;;              (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
  ;;              (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
  ;;              (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
  ;;              (91 . ".\\(?:]\\)")
  ;;              (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
  ;;              (94 . ".\\(?:=\\)")
  ;;              (119 . ".\\(?:ww\\)")
  ;;              (123 . ".\\(?:-\\)")
  ;;              (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
  ;;              (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
  ;;              )
  ;;            ))
  ;; (dolist (char-regexp alist)
  ;;   (set-char-table-range composition-function-table (car char-regexp)
  ;;                         `([,(cdr char-regexp) 0 font-shape-gstring]))))

  ;; Fix yaml new line indent
  (setq-default yaml-indent-offset 4)
  ;;

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pcache sourcerer-theme names chinese-word-at-point skewer-mode helm-purpose window-purpose haml-mode gitignore-mode seq flx highlight web-completion-data dash-functional pos-tip bind-map pythonic pinyinlib ace-jump-mode popup package-build spinner epl s slime-company pug-mode hide-comnt imenu-list vmd-mode zenburn-theme yaml-mode xterm-color ws-butler window-numbering which-key web-mode use-package ujelly-theme toml-mode tao-theme spaceline slime racer planet-theme persp-mode orgit org organic-green-theme org-projectile org-pomodoro alert org-plus-contrib org-download open-junk-file omtose-phellack-theme ob-ipython neotree naquadah-theme mwim monokai-theme moe-theme matlab-mode material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow lua-mode less-css-mode julia-mode json-mode js2-refactor multiple-cursors indent-guide hl-todo highlight-numbers helm-themes helm-pydoc helm-projectile helm-make projectile helm-descbinds helm-dash helm-c-yasnippet helm-ag gruvbox-theme grandshell-theme gotham-theme google-translate git-messenger git-link flyspell-correct-helm flyspell-correct flycheck-rust expand-region exec-path-from-shell evil-unimpaired evil-surround evil-search-highlight-persist evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-iedit-state iedit evil-exchange evil-ediff eshell-prompt-extras emmet-mode dracula-theme darktooth-theme darkokai-theme company-anaconda color-theme-sanityinc-tomorrow color-identifiers-mode coffee-mode chinese-pyim chinese-pyim-basedict badwolf-theme auto-yasnippet auto-compile apropospriate-theme anti-zenburn-theme anaconda-mode ample-theme ace-link auto-complete rust-mode yasnippet tern anzu smartparens evil grizzl flycheck company request helm helm-core avy hydra f js2-mode simple-httpd dash spacemacs-theme zonokai-theme zen-and-art-theme youdao-dictionary yapfify xkcd wolfram-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen undo-tree underwater-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org thrift tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme stan-mode spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode scad-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme quelpa qml-mode pyvenv pytest pyenv-mode py-isort purple-haze-theme professional-theme powerline popwin pkg-info pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el pbcopy pastels-on-dark-theme parent-mode paradox pangu-spacing packed osx-trash osx-dictionary org-present org-bullets oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme mustang-theme multi-term move-text monochrome-theme molokai-theme mmm-mode minimal-theme macrostep lush-theme lorem-ipsum log4e livid-mode live-py-mode linum-relative link-hint light-soap-theme launchctl json-snatcher json-reformat js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ ido-vertical-mode hy-mode hungry-delete htmlize highlight-parentheses highlight-indentation heroku-theme hemisu-theme help-fns+ helm-swoop helm-mode-manager helm-gitignore helm-flx helm-css-scss helm-company hc-zenburn-theme gruber-darker-theme graphviz-dot-mode goto-chg golden-ratio gnuplot gntp gitconfig-mode gitattributes-mode git-timemachine gh-md gandalf-theme flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme find-by-pinyin-dired fill-column-indicator fasd farmhouse-theme fancy-battery eyebrowse evil-visualstar evil-visual-mark-mode evil-tutor evil-numbers evil-nerd-commenter evil-lisp-state evil-indent-plus evil-escape evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z esh-help elisp-slime-nav dumb-jump django-theme diminish dash-at-point darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode company-web company-tern company-statistics common-lisp-snippets column-enforce-mode colorsarenice-theme color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-key auto-highlight-symbol auto-dictionary async arduino-mode ample-zen-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-pinyin ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
