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

(setq org-html-postamble-format '(("en" "
<div>
<br />
<p class=\"author\">Author: %a</p>
<p class=\"date\">Date: %d</p>
<br />
<br />
</div>

<!-- UY BEGIN -->
<div id=\"uyan_frame\"></div>
<script type=\"text/javascript\" src=\"http://v2.uyan.cc/code/uyan.js\"></script>
<!-- UY END -->
")))

(defun my-blog-make-blog-project (project-name folder)
  "Make a blog org project entry, which can be append into
`org-publish-project-alist'. "
  (list project-name
        ':base-directory folder
        ':base-extension "org"
        ':publishing-directory folder
        ':publishing-function 'org-html-publish-to-html
        ':headline-levels 3
        ':section-numbers nil
        ':with-toc nil
        ':html-head "<link rel=\"stylesheet\" href=\"../css/default.css\" type=\"text/css\" />"
        ':html-postamble t))

(setq org-publish-project-alist
      (list (my-blog-make-blog-project "blog" "./blog")
            (my-blog-make-blog-project "draft-blog" "./draft-blog")))

(org-publish-all)

(message "all done")
