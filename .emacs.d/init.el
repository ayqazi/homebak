(package-initialize)

; Language stuff
;(require 'python-mode)

;(setq auto-mode-alist (cons '("\\.py\\'" . python-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("SConstruct\\'" . python-mode) auto-mode-alist))

(require 'enh-ruby-mode)

(add-to-list 'interpreter-mode-alist `("ruby" . enh-ruby-mode))

(add-to-list `auto-mode-alist `("\\.rb\\'" . enh-ruby-mode))
(add-to-list `auto-mode-alist `("\\.rake\\'" . enh-ruby-mode))
(add-to-list `auto-mode-alist `("\\.ru\\'" . enh-ruby-mode))
(add-to-list `auto-mode-alist `("\\.gemspec\\'" . enh-ruby-mode))
(add-to-list `auto-mode-alist `("Rakefile\\'" . enh-ruby-mode))
(add-to-list `auto-mode-alist `("Gemfile\\'" . enh-ruby-mode))
(add-to-list `auto-mode-alist `("Vagrantfile\\'" . enh-ruby-mode))
(add-to-list `auto-mode-alist `("\\.cfndsl\\'" . enh-ruby-mode))
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(add-to-list `auto-mode-alist `("\\.js\\'" . javascript-mode))
(add-to-list `auto-mode-alist `("\\.js.erb\\'" . javascript-mode))
(add-to-list `auto-mode-alist `("\\.pac\\'" . javascript-mode))

(add-to-list `auto-mode-alist `("\\.scss.erb\\'" . css-mode))
(add-to-list `auto-mode-alist `("\\.scss\\'" . css-mode))
(add-to-list `auto-mode-alist `("\\.css.erb\\'" . css-mode))

(add-to-list `auto-mode-alist `("\\.yml.j2\\'" . yaml-mode))

(add-to-list 'load-path "~/.emacs.d/jslint-v8")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\.erb\\'" . web-mode))

(setq web-mode-engines-alist '(("erb"  . "\\.erb\\.")))

(add-hook 'after-init-hook 'global-company-mode)

;Customize all c-mode languages Screw (not literally, of course) the
;GNU coding standard, use Linuses one (ala Linux kernel) with some
;small personalised changes.
(defun my-c-mode-common-hook ()
  (c-set-style "K&R")
  (setq c-basic-offset 8)
  (c-set-offset 'access-label '-)
  (c-set-offset 'member-init-intro '1)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'inline-close '0)
  (c-set-offset 'inextern-lang '0)
  (setq indent-tabs-mode nil)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;Customize C++ only c-mode
(defun my-c++-mode-hook ()
  (c-set-offset 'innamespace '0)
  )
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;Customise Java only c-mode
(defun my-java-mode-hook ()
  (setq c-basic-offset 4)
  )
(add-hook 'java-mode-hook 'my-java-mode-hook)


;Customize perl-mode
(defun my-perl-mode-hook ()
  (setq perl-indent-level 8)
  )
(add-hook 'perl-mode-hook 'my-perl-mode-hook)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'ruby-block)
(ruby-block-mode t)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)


; Customised key bindings by me
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key [insert] nil)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-a" 'back-to-indentation)
(global-set-key (kbd" C-x M-k") 'bury-buffer)
(global-set-key "\C-z" nil)

; Start server
; (server-start)

; Read abbrevs file
(quietly-read-abbrev-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-log-full-name "Asfand Yar Qazi")
 '(add-log-keep-changes-together t)
 '(add-log-mailing-address "ayqazi AT gmail DOT com")
 '(auto-compression-mode t nil (jka-compr))
 '(auto-revert-interval 3)
 '(backward-delete-char-untabify-method nil)
 '(blink-cursor-mode nil)
 '(buffers-menu-max-size 10)
 '(change-log-default-name "Changes.txt")
 '(column-number-mode t)
 '(comment-auto-fill-only-comments t)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(cperl-indent-level 8)
 '(css-indent-offset 2)
 '(dabbrev-case-fold-search t)
 '(default-frame-alist (quote ((width . 120) (height . 60))))
 '(electric-indent-mode nil)
 '(enh-ruby-add-encoding-comment-on-save nil)
 '(enh-ruby-bounce-deep-indent t)
 '(enh-ruby-check-syntax (quote errors))
 '(enh-ruby-deep-indent-paren nil)
 '(enh-ruby-extra-keywords (quote ("raise")))
 '(enh-ruby-program "/home/ayqazi/.rbenv/shims/ruby")
 '(enh-ruby-use-encoding-map nil)
 '(focus-follows-mouse t)
 '(font-lock-maximum-size nil)
 '(global-cwarn-mode t nil (cwarn))
 '(global-font-lock-mode t nil (font-lock))
 '(global-mark-ring-max 64)
 '(global-subword-mode t)
 '(ido-case-fold t)
 '(ido-confirm-unique-completion t)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote text-mode))
 '(initial-scratch-message nil)
 '(jit-lock-chunk-size 5000)
 '(js-enabled-frameworks (quote (javascript prototype extjs)))
 '(js-indent-level 4)
 '(js2-cleanup-whitespace t)
 '(js2-mirror-mode nil)
 '(make-backup-files nil)
 '(mark-ring-max 64)
 '(menu-bar-mode t)
 '(mouse-scroll-min-lines 2)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(php-mode-warn-if-mumamo-off "Don't warn")
 '(ps-print-header nil)
 '(ps-print-header-frame nil)
 '(py-backspace-function (quote backward-delete-char))
 '(require-final-newline t)
 '(rng-nxml-auto-validate-flag nil)
 '(ruby-block-delay 0)
 '(ruby-block-highlight-toggle t)
 '(ruby-deep-indent-paren (quote (t)))
 '(ruby-indent-level 2)
 '(ruby-indent-tabs-mode nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   (quote
    ((engine . selmer)
     (engine . mustache)
     (encoding . utf-8)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(server-kill-new-buffers t)
 '(sgml-basic-offset 2)
 '(sh-basic-offset 8)
 '(sh-indent-for-case-alt (quote +))
 '(sh-indent-for-case-label 0)
 '(show-paren-mode t nil (paren))
 '(speedbar-show-unknown-files t)
 '(speedbar-verbosity-level 2)
 '(tool-bar-mode nil nil (tool-bar))
 '(truncate-partial-width-windows nil)
 '(uniquify-ask-about-buffer-names-p t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(vc-handled-backends nil)
 '(version-control (quote never))
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-engine-detection t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(x-select-enable-clipboard nil)
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fdfcfa" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(cursor ((t nil)))
 '(web-mode-symbol-face ((t (:foreground "dark cyan")))))


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
