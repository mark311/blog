## 简介

这是我基于emacs org-mode搭建的建议博客。博文编辑使用emacs org-mode这个
强大的工具，发布的过程是通过执行org-mode的publish函数，在本地生成静态
的html。最后通过文件上传同步工具发布到我的公网服务器上。

## 发布

用emacs打开publish.el这个脚本，执行 `M-x eval-buffer` 即可完成发布。
