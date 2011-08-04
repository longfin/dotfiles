(set-language-environment "UTF-8")
(setq load-path (cons (expand-file-name "~/.emacs.d/") load-path))

(set-terminal-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;(set-selection-coding-system 'utf-8)
;(set-buffer-file-coding-system 'utf-8) 
(setq default-tab-width 4)

(load "~/.emacs.d/hangul.el")
(require 'hangul)

(add-to-list 'load-path "~/.emacs.d/nxhtml")
(load "~/.emacs.d/nxhtml/autostart.el")

(add-hook 'nxml-mode-hook 
          '(lambda()
             (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq indent-tabs-mode t)
             (setq nxml-child-indent 4)
             (setq nxml-slash-auto-complete-flag t)
             (message "customize nxml-mode")))

(add-to-list 'auto-mode-alist '("\\.htm\\'" . nxhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . nxhtml-mode))

(when (locate-library "erc")
  (require 'erc)
  (setq erc-server "purple.hanirc.org:6666")
  (setq erc-default-coding-system '(cp949 . undecided)))


(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.5/emacs/" load-path)) 
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path)) 
(let 
    ((distel-dir "/usr/local/share/distel/elisp")) 
  (unless 
      (member distel-dir load-path) 
    (setq load-path 
	  (append load-path (list distel-dir))))) 

(require 'distel)

(add-hook 'eshell-mode-hook
	  '(lambda nil
	     (eshell/export "LANG=ko_KR.UTF-8")))

(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun lein-swank ()
  (interactive)
  (let ((root (locate-dominating-file default-directory "project.clj")))
    (when (not root)
      (error "Not in a Leiningen project."))
    ;; you can customize slime-port using .dir-locals.el
    (shell-command (format "cd %s && lein swank %s &" root 4005)
                   "*lein-swank*")
    (set-process-filter (get-buffer-process "*lein-swank*")
                        (lambda (process output)
                          (when (string-match "Connection opened on" output)
                            (slime-connect "localhost" 4005)
                            (set-process-filter process nil))))
    (message "Starting swank server...")))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(iswitchb-mode t)


(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(add-hook 'scheme-mode-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))

(setq scheme-program-name "plt-r5rs")

(setq slime-net-coding-system 'utf-8-unix)
(setq slime-protocol-version 'ignore)

;; Mumamo is making emacs 23.3 freak out:
(when (and (equal emacs-major-version 23)
           (equal emacs-minor-version 3))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function)))

(load "~/.emacs.d/package.el")
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(setq ring-bell-function 'ignore)

(add-to-list 'load-path "~/.emacs.d/slime-2011-08-03")  ; your SLIME directory
(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(require 'slime)
(slime-setup '(slime-repl slime-js))

(setq inhibit-splash-screen t)
(setq slime-net-coding-system 'utf-8-unix)


;; Setup PATH 
(setenv "PATH" (shell-command-to-string "source ~/.bashrc; echo -n $PATH"))
;; Update exec-path with the contents of $PATH
(loop for path in (split-string (getenv "PATH") ":") do 
      (add-to-list 'exec-path path))

;; Setup JAVA_TOOL_OPTIONS
(setenv "JAVA_TOOL_OPTIONS" (shell-command-to-string "source ~/.bashrc; echo -n $JAVA_TOOL_OPTIONS"))

;; Grab other environment variables
(loop for var in (split-string (shell-command-to-string "source ~/.bashrc; 
env")) do
      (let* ((pair (split-string var "="))
             (key (car pair))
             (value (cadr pair)))
        (unless (getenv key)
          (setenv key value))))

(setq make-backup-files nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(markdown-command "~/dev/Markdown_1.0.1/Markdown.pl"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; moz-repl
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'js2-mode-hook 'js2-custom-setup)
(defun js2-custom-setup ()
  (moz-minor-mode 1))

;; swank-js
(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))