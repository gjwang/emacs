;; load initialize for cua-mode and etc. after site-start in linux
;;(if (not (equal (getenv "HOSTTYPE") "sparc"))

;;    (load "/icdev/local/bin/site-start.linux-app.el" nil t t ))
;; =================================================================
;; Load
;; =================================================================

;; =================================================================
;; Saving Emacs Sessions - Useful when you have a bunch of source
;; files open and you don't want to go and manually open each
;; one, especially when they are in various directories. Page 377
;; of the GNU Emacs Manual says: "The first time you save the state
;; of the Emacs session, you must do it manually, with the command
;; M-x desktop-save. Once you have dome that, exiting Emacs will
;; save the state again -- not only the present Emacs session, but
;; also subsequent sessions. You can also save the state at any
;; time, without exiting Emacs, by typing M-x desktop-save again.
;; =================================================================
(load "desktop")
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(desktop-load-default)

;; make verilog file .v
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(setq auto-mode-alist (cons  '("\\.v\\'" . verilog-mode) auto-mode-alist))

;; make .l_bashrc shell-script file
(setq auto-mode-alist (cons '("\\.l_bashrc" . shell-script-mode) auto-mode-alist))
;; make .pt or *.synopsys_pt.setup a .tcl file
;(setq auto-mode-alist (cons '("\\.pt\\'" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.pt$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.synopsys_..\\.setup$" . tcl-mode) auto-mode-alist))
;; make *.synopsys_dc.setup a .scr file

;; make vflist vfl files a .c file
;(setq auto-mode-alist (cons '("vfl\\(ist\\|_*\\)" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("vfl_.+" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("vflist$" . c-mode) auto-mode-alist))

(desktop-read)

;; Info
(load "info")

;; A nice buffer handling
(load "msb")

;; =================================================================
;; Behavior of emacs
;; =================================================================
;; command history length
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(column-number-mode t)
 '(comint-completion-autolist nil)
 '(comint-completion-fignore (quote ("~" "#" "%" ".o")))
 '(comint-input-ignoredups (quote t))
 '(comint-input-ring-size 500)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(display-time-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(history-length 500)
 '(next-line-add-newlines nil)
 '(scroll-bar-mode (quote right))
 '(shell-completion-fignore (quote ("~" "#" "%" ".o")))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
;; '(line-number-display-limit 400000000))

;; shell/comint Completion


;(partial-completion-mode)

;; No new line due to cursor move


(put 'narrow-to-region 'disabled nil)
(auto-compression-mode)

;; No too many #*, *~ files
(setq make-backup-files nil)

;; Make the % key jump to the matching {}[]() if on another, like VI
(global-set-key "%" 'match-paren)      
  
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; This maps edit keys to standard Windows keystokes. It requires the
;; library cua-mode.el from Kim Storm at the following URL:
(load "~/.cua-mode.el" nil t t)
;;(load "cua-mode")
(CUA-mode t)

;; Suppress echoing when a subprocess asks for a password
(defcustom comint-password-prompt-regexp
  "\\(\\([Oo]ld \\|[Nn]ew \\|Kerberos \\|'s \\|login \\|^CVS \\|^\\)\
[Pp]assword\\( (again)\\)?\\|pass phrase\\|Enter passphrase\\)\
\\( for [^@ \t\n]+@[^@ \t\n]+\\)?:\\s *\\'"
  "*Regexp matching prompts for passwords in the inferior process.
This is used by `comint-watch-for-password-prompt'."
  :type 'regexp
  :group 'comint)

(add-hook 'comint-output-filter-functions
  'comint-watch-for-password-prompt)

;; Let the emacsclient can be runed
;(setenv "IN_EMACS" "in_emacs")
;(load "resume")
;(add-hook 'suspend-hook 'resume-suspend-hook)
;(add-hook 'suspend-resume-hook 'resume-process-args)
;(server-start)

;; =================================================================
;; Out Look of emacs
;; =================================================================

;; Show clock in status bar
;; Comment out first line if you prefer to show time in 12 hour format
(setq display-time-24hr-format t)
(setq display-time-day-and-date nil)
(display-time)

;; Display the current column number on mode line
(column-number-mode t)

;; Set sub-mouse-menu min number
(setq mouse-buffer-menu-mode-mult 2)

;; Don't display menu bar. Type M-x menu-bar-mode to display it
(menu-bar-mode '-1)
;; Don't display tool bar. Type M-x tool-bar-mode to display it
(if (not (equal (getenv "HOSTTYPE") "sparc"))
    (tool-bar-mode '-1))

;; Scroll bar place

;(custom-set-variables '(scroll-bar-mode (quote left)))

;; Make temp buffer size min
(temp-buffer-resize-mode '1)

;; =================================================================
;; Color setting.
;; Color is also inferenced by .Xdefault and emacs command option
;; =================================================================

;; Set global font lock mode
(global-font-lock-mode '1)
;(global-font-lock-mode t)

;; Set foreground and background. black or dimgrey may be choosed
(set-foreground-color "white")
(set-background-color "Gray22")
;(set-background-color "CornflowerBlue")
;(set-background-color "DarkSlateBlue")
;(set-background-color "MidnightBlue")
;(set-background-color "Black")

;; Set the mouse and cursor color
(set-mouse-color "yellow")
(set-cursor-color "red")

;; Set manual face color
(set-face-foreground 'info-xref "cyan")
(set-face-foreground 'info-node "red")

(setq Man-overstrike-face 'info-node)
(setq Man-underline-face 'info-xref)
;(setq Info-directory-list '("/icdev/users/jzhang/Software/tmp/info/"))

;; Set some font face
;(set-face-foreground 'font-lock-comment-face "red")
;(set-face-foreground 'font-lock-comment-face "Coral")
(set-face-foreground 'font-lock-comment-face "OrangeRed")
;(set-face-foreground 'font-lock-string-face "CadetBlue1")
;(set-face-foreground 'font-lock-variable-name-face "yellow")
;(set-face-foreground 'font-lock-function-name-face "CadetBlue1")

;; =================================================================
;; Key Binding
;; =================================================================

;; Book mark 1
(global-set-key [f1] 'bookmark-jump-default1)
(defun bookmark-jump-default1 (pos)
  "Set a default bookmark 1 default-bookmark1 at current position"
  (interactive "d")
  (bookmark-jump "default-bookmark1")
  (bookmark-set "default-bookmark1"))

(global-set-key [C-f1] 'bookmark-set-default1)
(defun bookmark-set-default1 (pos)
  "Jump to the default bookmark 1 default-bookmark1"
  (interactive "d")
  (bookmark-set "default-bookmark1"))

;; Book mark 2
(global-set-key [f2] 'bookmark-jump-default2)
(defun bookmark-jump-default2 (pos)
  "Set a default bookmark 2 default-bookmark2 at current position"
  (interactive "d")
  (bookmark-jump "default-bookmark2")
  (bookmark-set "default-bookmark2"))

(global-set-key [C-f2] 'bookmark-set-default2)
(defun bookmark-set-default2 (pos)
  "Jump to the default bookmark 2 default-bookmark2"
  (interactive "d")
  (bookmark-set "default-bookmark2"))

(global-set-key [S-f2] 'bookmark-jump)
(global-set-key [S-C-f2] 'bookmark-set)

;; Set the word search keys
(define-key global-map [f3] 'isearch-forward)
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)
(define-key global-map [C-f3] 'isearch-forward-regexp)
(define-key global-map [S-f3] 'isearch-backward)
(define-key isearch-mode-map [S-f3] 'isearch-repeat-backward)
(define-key global-map [C-S-f3] 'isearch-backward-regexp)

;; Kill buffer/emacs
(global-set-key [C-f4] 'kill-this-buffer)
(global-set-key [M-f4] 'save-buffers-kill-emacs)

;; Alternative copy/paste
(global-set-key [f4] 'copy-to-register-t)
(defun copy-to-register-t (start end)
  "Copy the selected region into a default register, t"
  (interactive "r")
  (copy-to-register t start end)
  (if transient-mark-mode (setq deactivate-mark t)))

(global-set-key [S-f4] 'insert-register-t)
(defun insert-register-t (pos)
  "Insert the contents of default register, t, into current position"
  (interactive "d")
  (insert-register t 1))

;; Go to line
(global-set-key [f5] 'goto-line)

;; Switch windows/buffers
(global-set-key [f6] 'other-window)
(global-set-key [C-f6] 'switch-to-buffer)
(global-set-key [S-f6] 'buffer-menu)

;; Search previour/next issued commend
(global-set-key [S-f7] 'comint-next-matching-input-from-input)
(global-set-key [f7] 'comint-previous-matching-input-from-input)

;; Replace
(global-set-key [f9] 'query-replace)
(global-set-key [C-f9] 'query-replace-regexp)
(global-set-key [S-f9] 'query-replace-reg-t)

(defun query-replace-reg-t (to-string)
  (interactive (let (to)
		 (setq to (read-from-minibuffer
			   (format "Query-replace \"%s\" with: "
				   (get-register t))
			   nil nil nil
			   query-replace-to-history-variable nil t))
		 (list to)))
  (perform-replace (get-register t) to-string t nil nil))

(global-set-key [f10] 'replace-string)
(global-set-key [C-f10] 'replace-string-regexp)
(global-set-key [S-f10] 'replace-string-reg-t)

(defun replace-string-reg-t (to-string)
  (interactive (let (to)
		 (setq to (read-from-minibuffer
			   (format "Replace \"%s\" with: "
				   (get-register t))
			   nil nil nil
			   query-replace-to-history-variable nil t))
		 (list to)))
  (perform-replace (get-register t) to-string nil nil nil))

;; Split/combine windows
(global-set-key [f11] 'delete-other-windows)
(global-set-key [S-f11] 'delete-window)
(global-set-key [f12] 'split-window-vertically)
(global-set-key [S-f12] 'split-window-horizontally)

;; Mouse operation
(global-set-key [mouse-3] 'mouse-buffer-menu)

;; Common MSWIN like keys
(global-set-key "\C-o" 'find-file)
(global-set-key "\C-s" 'save-all-buffers)
(global-set-key "\C-p" 'pwd)
(global-set-key [C-backspace] 'backward-kill-word)
(global-set-key [C-delete] 'kill-word)
(global-set-key "\C-d" 'kill-whole-line)

(defun kill-whitespace-or-word ()
  (interactive)
  (if (looking-at "[ \t\n]")
      (let ((p (point)))
        (re-search-forward "[^ \t\n]" nil :no-error)
        (backward-char)
        (kill-region p (point)))
    (kill-word 1)))

(global-set-key (kbd "M-d") 'kill-whitespace-or-word)

(defun save-all-buffers ()
			 "Save buffers"
			 (interactive)
			 (save-some-buffers t)
)


(defun kill-whole-line ()
  "Kill the whole line the cursor located"
  (interactive)
  (beginning-of-line nil)
  (kill-line nil)
  (kill-line nil))

;; verilog module assistant command and supported functions
;(global-set-key "\M-i" 'convert-list-to-instance)
;(global-set-key "\M-l" 'convert-declaration-to-list)
;(global-set-key "\M-d" 'convert-list-to-declaration)

(defun convert-list-to-instance (start end)
  "Convert port list selected to module instance"
  (interactive "r")
  (shell-command-on-region start end "/icdev/local/bin/pl_mi"))

(defun convert-declaration-to-list (start end)
  "Convert port declaration selected to port list"
  (interactive "r")
  (shell-command-on-region start end "/icdev/local/bin/pd_pl"))

(defun convert-list-to-declaration (start end)
  "Convert port list selected to port declaration"
  (interactive "r")
  (shell-command-on-region start end "/icdev/local/bin/pl_pd"))

(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;不显示GNU emacs启动界面
(setq inhibit-startup-message t) 

;; =================================================================
;; Shell
;; =================================================================
(shell)
(rename-buffer "shella")

(shell)
(rename-buffer "shellb")

(shell)
(rename-buffer "shellc")

(shell)
(rename-buffer "shellx")

;; =================================================================
;; load user local emacs initial file if it exists
;; =================================================================

(load "~/.emacs.d/cscope-15.7a/contrib/xcscope/xcscope.el" t t t)
;(load "~/.emacs.d/cscope-15.7a/contrib/xcscope/cscope-indexer" t t t)
(require 'xcscope)
;(add-hook 'c-mode-common-hook '(lambda() (require 'xcscope)))
(define-key global-map [(control f3)]  'cscope-set-initial-directory)

;(define-key global-map [(control f4)]  'cscope-unset-initial-directory)

(define-key global-map [(control f5)]  'cscope-find-this-symbol)

;(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]  'cscope-find-global-definition)

;(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)

(define-key global-map [(control f8)]  'cscope-pop-mark)

;(define-key global-map [(control f9)]  'cscope-next-symbol)

;(define-key global-map [(control f10)] 'cscope-next-file)

;(define-key global-map [(control f11)] 'cscope-prev-symbol)

;(define-key global-map [(control f12)] 'cscope-prev-file)

;(define-key global-map [(meta f9)]     'cscope-display-buffer)

;(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)
(setq cscope-do-not-update-database t)

(show-paren-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d")
(require 'redo) 
(global-set-key "\C-z" 'undo)
(global-set-key "\M-z" 'redo)

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete-1.3/ac-dict")
(ac-config-default)


(require 'tabbar)
(tabbar-mode)
;(global-set-key (kbd "") 'tabbar-backward-group)
;(global-set-key (kbd "") 'tabbar-forward-group)
;(global-set-key (kbd "") 'tabbar-backward)
;(global-set-key (kbd "") 'tabbar-forward)

;(global-set-key [(shift \tab)] 'tabbar-backward-group)
;(global-set-key [C-S-kp-tab] 'tabbar-forward-group)
;(global-set-key [(win-<up>)] 'tabbar-backward)
;(global-set-key [(control \tab)] 'tabbar-forward)

;(global-set-key [S-f5] 'compile)
(global-set-key (kbd "C-<left>") 'tabbar-backward)        ; →
(global-set-key (kbd "C-<right>")  'tabbar-forward)       ; ←
(global-set-key (kbd "C-<prior>")  'tabbar-backward-group); ↓ down; prior: page-up
(global-set-key (kbd "C-<next>")    'tabbar-forward-group); ↑ up ; next: page-down




(global-set-key [(control \.)] 'ska-point-to-register)
(global-set-key [(control \,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;(desktop-save-mode 1)

(require 'recentf)
(recentf-mode 1)


(require 'ido)
(ido-mode t)
(load "~/.ido_emacs" t t t)


;; =================================================================
;; load user local emacs initial file if it exists
;; =================================================================

(load "~/.l_emacs" t t t)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Gray22" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 151 :width normal :foundry "bitstream" :family "Courier 10 Pitch")))))






(setq split-height-threshold 0)
(setq split-width-threshold nil)

;; F9 compile 
;; C-F9 save and compile

(defun defineCompileCmd()
  (interactive)
;  (setq boost_path "E:/workspace/C++/lib/boost/boost1.46")
;  (setq ace_src_path "E:/workspace/C++/lib/ace/ace6.0.4/ACE_wrappers")
;  (setq ace_include_path "E:/workspace/C++/lib/ace/ace6.0.4/ace/include")
;  (setq ace_mingw_lib_d "E:/workspace/C++/lib/ace/ace6.0.4/ace/lib_gcc/lib_d")
;  (setq ace_mingw_lib "E:/workspace/C++/lib/ace/ace6.0.4/ace/lib_gcc/lib")
;  (setq compile_file_name (substring (buffer-name (current-buffer)) 0 (string-match "[.]"  (buffer-name (current-buffer)))))
;  (setq compile_file_name (concat compile_file_name ".exe"))
  (setq compile-command 
;	(concat  "g++ -g -I"
;		boost_path
;		" -I"
;		ace_src_path
;		" -I"
;		ace_include_path
;		" -L"
;		ace_mingw_lib
;		" -lACE " 
;		(buffer-name (current-buffer))
;		" -o "
;		compile_file_name
;		" && "
;		compile_file_name
;		)
  )
)

 
(defun shrink-compile-window()
  "shrink compile window, avoid compile window occupy 1/2 hight of whole window"
  (interactive)
  ;;(select-window (get-buffer-window "*compilation*"))
  (setq compiled_buffer_name (buffer-name (current-buffer)))
  (switch-to-buffer-other-window "*compilation*")
  (if (< (/ (frame-height) 3) (window-height))
      (shrink-window (/ (window-height) 2)))
  (switch-to-buffer-other-window compiled_buffer_name)
  )

 
;;C-F9 save all buffers and compile
(global-set-key [C-f9] '(lambda()
			 "Save buffers and start compile"
			 (interactive)
			 (save-some-buffers t)
			 ;(defineCompileCmd)
			 (compile compile-command)
			 (shrink-compile-window)
			 )
		) 

;;F9 compile current buffer
(global-set-key [f9] '(lambda ()
			(interactive)
			;(defineCompileCmd)	
			(compile compile-command)
			(shrink-compile-window)
			)
)


(setq tags-file-name "~/android-4.1_2/TAGS")

(setq visible-bell t)
