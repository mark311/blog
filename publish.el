(setq my-blog-project-root (file-name-directory (buffer-file-name)))
(setq my-blog-output-dir "out")
(setq my-blog-blog-source-dir (concat my-blog-project-root "/" "blog"))
(setq my-blog-blog-output-dir (concat my-blog-project-root "/" my-blog-output-dir "/" "blog"))


(setq org-publish-project-alist
      (list (list "blog"
                  ':base-directory my-blog-blog-source-dir
                  ':base-extension "org"
                  ':publishing-directory my-blog-blog-output-dir
                  ':publishing-function 'org-html-publish-to-html
                  ':headline-levels 3
                  ':section-numbers nil
                  ':with-toc nil)))

(org-publish-all)

