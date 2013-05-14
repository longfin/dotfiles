(require 'cl)
(setq inhibit-splash-screen t)
(set-language-environment "UTF-8")
(setq load-path (cons (expand-file-name "~/.emacs.d/") load-path))

(set-terminal-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-tab-width 4)

(load "~/.emacs.d/hangul.el")
(require 'hangul)

(add-to-list 'load-path "~/.emacs.d/nxhtml")
(load "~/.emacs.d/nxhtml/autostart.el")

(add-hook 'nxml-mode-hook 
          '(lambda()
             (setq c-basic-offset 2)
             (setq tab-width 2)
             (setq indent-tabs-mode nil)
             (setq nxml-child-indent 2)
             (setq nxml-slash-auto-complete-flag t)
             (message "customize nxml-mode")))

(add-to-list 'auto-mode-alist '("\\.htm\\'" . nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . nxhtml-mumamo-mode))

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

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(iswitchb-mode t)


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

;; (add-to-list 'load-path "~/.emacs.d/slime-2012-02-15")  ; your SLIME directory
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; (setq inferior-lisp-program "sbcl") ; your Lisp system
;; (require 'slime)
;; (slime-setup '(slime-repl slime-asdf))
;; (setq slime-net-coding-system 'utf-8-unix)


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
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(facebook-session-info (quote ((request_args . [((value . "f2a0dcdc0d9025c3bfcc0db130d5cc32") (key . "sig")) ((value . "497592876921690") (key . "api_key")) ((value . "0263f24ab3a5211d694fa48d83c5f205") (key . "auth_token")) ((value . "20746823191214") (key . "call_id")) ((value . "JSON") (key . "format")) ((value . "auth.getSession") (key . "method")) ((value . "1.0") (key . "v"))]) (error_msg . "Invalid parameter") (error_code . 100))))
 '(markdown-command "pandoc")
 '(menu-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fcf4dc" :foreground "#52676f" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "NanumGothicCoding"))))
 '(mumamo-background-chunk-major ((t nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background light)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background light)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background light)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background light)) nil))))

;; tumble setting

(require 'tumble)

;; add port option to sql-mysql
(defadvice sql-mysql (around with-port activate)
  (let* ((port (read-string "Port: "))
		 (sql-mysql-options 
		  (if (not (string= "" port))
			  (append sql-mysql-options (list (concat "--port=" port)))
			sql-mysql-options)))
	ad-do-it))

;; tag navigation shortcut

;;(fset 'find-next-tag "\C-u\256")        ; macro for C-u M-.
;;(fset 'find-prev-tag "\C-u-\256")       ; macro for C-u - M-.
;;(global-set-key "\M-]" 'find-next-tag)
;;(global-set-key "\M-[" 'find-prev-tag)
;;(global-set-key "\M-\," 'pop-tag-mark)


(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)

(set-input-method "korean-hangul")


(add-hook 'js-mode-hook 
          '(lambda()
             (setq c-basic-offset 4)
			 (setq js-indent-level 4)
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
			 (auto-complete-mode 1)))

(add-hook 'java-mode-hook
		  (lambda ()
			"Treat Java 1.5 @-style annotations as comments."
			(setq c-comment-start-regexp "(@|/(/|[*][*]?))")
			(modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(add-hook 'java-mode-hook
		  (lambda ()
			(setq c-basic-offset 4
				  tab-width 4
				  indent-tabs-mode nil)))


;; (defvar real-keyboard-keys
;;   '(("M-<up>"        . "\M-[1;3A")
;;     ("M-<down>"      . "\M-[1;3B")
;;     ("M-<right>"     . "\M-[1;3C")
;;     ("M-<left>"      . "\M-[1;3D")
;;     ("C-<return>"    . "\C-j")
;;     ("C-<delete>"    . "\M-[3;5~")
;;     ("C-<up>"        . "\M-[1;5A")
;;     ("C-<down>"      . "\M-[1;5B")
;;     ("C-<right>"     . "\M-[1;5C")
;;     ("C-<left>"      . "\M-[1;5D"))
;;   "An assoc list of pretty key strings
;; and their terminal equivalents.")

(defvar real-keyboard-keys
  '(("M-<up>"        . "\C-[\C-[OA")
	("M-<down>"      . "\C-[\C-[OB")
	("M-<right>"     . "\C-[\C-[OC")
	("M-<left>"      . "\C-[\C-[OD")
	("C-<up>"        . "\C-[[A")
	("C-<down>"      . "\C-[[B")
	("C-<right>"     . "\C-[[C")
	("C-<left>"      . "\C-[[D"))
   "An assoc list of pretty key strings and their terminal equivalents.")

(defun key (desc)
  (or (and window-system (read-kbd-macro desc))
      (or (cdr (assoc desc real-keyboard-keys))
          (read-kbd-macro desc))))

(global-set-key (key "M-<left>") 'windmove-left)          ; move to left windnow
(global-set-key (key "M-<right>") 'windmove-right)        ; move to right window
(global-set-key (key "M-<up>") 'windmove-up)              ; move to upper window
(global-set-key (key "M-<down>") 'windmove-down)          ; move to downer window

(global-set-key (key "s-j") 'windmove-left)          ; move to left windnow
(global-set-key (key "s-k") 'windmove-up)              ; move to upper window
(global-set-key (key "s-l") 'windmove-down)          ; move to downer window
(global-set-key (key "s-;") 'windmove-right)        ; move to right window

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-auto-revert-mode t)

(setq virtualenv-root ".")

(setq
 nxhtml-global-minor-mode t
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)

;; jinja mode
(load "~/.emacs.d/jinja.el")

(add-hook 'css-mode-hook 
          '(lambda()
             (setq c-basic-offset 2)
             (setq tab-width 2)
			 (setq css-indent-offset 2)
             (setq indent-tabs-mode nil)
			 (auto-complete-mode 1)))

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))

(require 'uniquify)
(setq uniqueify-buffer-name-style 'reverse)

(add-hook 'markdown-mode-hook
		  '(lambda ()
			 (setq c-basic-offset 4)
			 (setq tab-width 4)
			 (setq indent-tabs-mode nil)))

(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

(load "~/.emacs.d/itunes.el")
(require 'itunes)
(global-set-key (key "s-i") 'itunes-manip)


(setq column-number-mode t)


(defun iswitchb-local-keys ()
  (mapc (lambda (K) 
	      (let* ((key (car K)) (fun (cdr K)))
			(define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match)
	      ("<up>"    . ignore             )
	      ("<down>"  . ignore             ))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)


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

(require 'rcirc)
(setq rcirc-default-nick "longfin")
(setq rcirc-default-full-name "longfin")
(setq rcirc-server-alist
	  '(("irc.ozinger.org"
		 :channels ("#lispkorea-dev" "#longfin"))
		("irc.freenode.net"
		 :channels ("#ubuntu-ko" "#clojure" "#emacs"))))

(load "~/.emacs.d/rcirc-notify.el")
(require 'rcirc-notify)
(rcirc-notify-add-hooks)
(setq rcirc-notify-check-frame t)
(require `tramp)

(load "~/.emacs.d/calfw.el")
(load "~/.emacs.d/calfw-ical.el")
(load "~/.emacs.d/calfw-gcal.el")
(require 'calfw)
(require 'calfw-ical)
(require 'calfw-gcal)
(define-key cfw:calendar-mode-map (kbd "a") 'cfw:gcal-main)

(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:ical-create-source "gcal" "https://www.google.com/calendar/ical/longfinfunnel%40gmail.com/private-39eefe9355398578c74f9d2f0d17f531/basic.ics" "IndianRed")
   ))) 
(put 'upcase-region 'disabled nil)

(setq initial-scratch-message nil)

(global-set-key (kbd "M-j") 'backward-char) 
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-l") 'next-line)
(global-set-key (kbd "M-;") 'forward-char)
