;; Usage: execute `M-x eval-buffer' the first time you open Emacs,
;; later you can execute `M-x org-publish-all' anywhere to re-publish.

(setq my-blog-project-root (file-name-directory (buffer-file-name)))
(setq my-blog-blog-source-dir (concat my-blog-project-root "/" "blog"))

(setq org-publish-project-alist
      (list (list "blog"
                  ':base-directory my-blog-blog-source-dir
                  ':base-extension "org"
                  ':publishing-directory my-blog-blog-source-dir
                  ':publishing-function 'org-html-publish-to-html
                  ':headline-levels 3
                  ':section-numbers nil
                  ':with-toc nil)))

(org-publish-all)
