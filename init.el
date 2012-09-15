;; Marmalade Package Manager______________________________________________
;;(require 'package)
;;(add-to-list 'package-archives
;;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
;;(package-initialize)
;__________________________________________________________________________

;; Disable system beep
;;(setq ring-bell-function 'ignore)

;; Set el-get_____________________________________________________________
(add-to-list 'load-path "~/.emacs.d/el-get/")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

(el-get 'sync)
;_________________________________________________________________________

;; Disable system beep____________________________________________________
(setq ring-bell-function 'ignore)
;_________________________________________________________________________

; Set IDO customization___________________________________________________
(ido-mode 1)
(define-key evil-ex-map "e " 'ido-find-file)
(define-key evil-ex-map "w " 'ido-write-file)
(define-key evil-ex-map "b " 'ido-switch-buffer)
;_________________________________________________________________________

;; Set evil_______________________________________________________________
(add-to-list 'load-path "~/.emacs.d/evil")
    (require 'evil)
    (evil-mode 1)
;_________________________________________________________________________

;; Custom theme directory and file________________________________________
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (bubbleberry)))
 '(custom-safe-themes (quote ("f87e6316b1e6cfc1ba2ade7225f0bb1a3a63e43a0ced927c135eb8bb48361375" "92ffa62354bf270b2526bf541eb43eb4a471bb8a3f4f3d2f67052079995069e5" "586e5bb76cc42e33684c69a12930df656d33c8d19dc7c6d5970fdd25ea069b42" "668c57f968cf52b9fed3f11c1c7fb2b0497e6f4c126ecc4e9dd3480b828af803" "d2ad04cdf7af01a803f0dd1b399f3cf0904688121f8a680f7a1af3935f4f1625" "9aeb193fa1626559e224e9a754777579a53ac71b4cddd2b8d2b6ef9adbb37754" default)))
 '(fringe-mode 5 nil (fringe))
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-style face trailing lines-tail) (require-final-newline . t) (whitespace-line-column . 80) (lexical-binding . t)))))
;_________________________________________________________________________

;; Map jj to <Esc>________________________________________________________
(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))
;_________________________________________________________________________

;; Power liner configuration______________________________________________
;;(require 'powerline)
;;(powerline-default)
;; colors...
;;(setq powerline-color1 "#308")      ;; dark grey; 
;;(setq powerline-color2 "#104")      ;; slightly lighter grey
;; shape...
;;(setq powerline-arrow-shape 'arrow) ;; mirrored arrows, 
;_________________________________________________________________________
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
