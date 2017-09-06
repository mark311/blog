(require 'package)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'my-org-fixup)
(require 'my-utils)

;; External command / jar paths
(my-utils-append-exec-path "/usr/local/bin/")
(setq org-ditaa-jar-path "~/.emacs.d/java/ditaa0_9.jar")
(setq org-plantuml-jar-path "~/.emacs.d/java/plantuml.jar")

;; Set Org mode executable languages
;; see http://orgmode.org/org.html#Languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (gnuplot . t)
   (ditaa . t)
   (plantuml . t)
   (sh . t)
   (dot . t)
   (R . t)))

;; Disable babel comfirm
(setq org-confirm-babel-evaluate nil)

;; About Org project definition
(setq my-blog-project-root ".")
(setq my-blog-blog-source-dir (concat my-blog-project-root "/" "blog"))

(setq org-publish-project-alist
      (list (list "blog"
                  ':base-directory my-blog-blog-source-dir
                  ':base-extension "org"
                  ':publishing-directory my-blog-blog-source-dir
                  ':publishing-function 'org-html-publish-to-html
                  ':headline-levels 3
                  ':section-numbers nil
                  ':with-toc nil
                  ':html-head "<link rel=\"stylesheet\" href=\"../css/default.css\" type=\"text/css\" />")))

(org-publish-all)

(message "all done")
