最终一致性（Eventually Consistent）
====

一年前我写过关于一致性模型的[第一版文章](http://www.allthingsdistributed.com/2007/12/eventually_consistent.html)。因为当时写的很匆忙，所以我并不是很满意。时至今日这个topic已经非常重要了，值得更缜密的对待。ACM Queue请我重新修订它，并将发布在他们的杂志上。所以我有这个机会来改进这篇文章。这就是那份新的版本。

最终一致性 - 在全球范围内建立可靠的分布式系统需要在一致性和可用性之间做权衡（trade-offs）。

亚马逊云计算的根基，是诸如S3（Simple Storage Service）、SimpleDB、EC2（Elastic Compute Cloud）等用以构建Internet规模级别计算平台的基础设施服务，以及上层一些丰富的应用。对这些基础设施服务的要求是非常严格的，必须在安全性、可伸缩性、可用性、性能和成本有效性方面达到足够的水准；并持续服务于全球数以百万计的客户。

这些服务的底层是大量分布式系统，运行在世界范围内。这种规模创造了额外的挑战。因为当一个系统处理万亿数量的请求时，通常情况下非常罕见的事件会必然出现。这需要在系统设计和架构上做出考虑。针对这些世界范围内的系统，我们广泛使用冗余（replication）技术来保证一致性性能（consistent performance）和高可用性。尽管“冗余”让我们离目标更近了，却不能用一种透明的方式完美的实现这些目标。在一些情况下，服务的使用者需要面对由于使用冗余技术带来的后果。

One of the ways in which this manifests itself is in the type of data consistency that is provided, particularly when the underlying distributed system provides an eventual consistency model for data replication. When designing these large-scale systems at Amazon, we use a set of guiding principles and abstractions related to large-scale data replication and focus on the trade-offs between high availability and data consistency.

In this article I present some of the relevant background that has informed our approach to delivering reliable distributed systems that need to operate on a global scale. An earlier version of this text appeared as a posting on the All Things Distributed weblog in December 2007 and was greatly improved with the help of its readers.

表现形式之一是所提供的数据一致性的类型，尤其是底层分布式系统提供一种数据冗余的最终一致性模型（One of the ways in which this manifests itself is in the type of data consistency that is provided, particularly when the underlying distributed system provides an eventual consistency model for data replication.）。在Amazon，我们设计这些大规模系统时使用一系列关于大规模数据冗余的指导原则和抽象方法，关注高可用性和数据一致性之间的平衡。在这篇文章里，我将介绍一些背景，它使得我们的方案能提供在全球范围内运行的可靠的分布式系统。早些发布在All Things Distributed网络博客上的[一篇文章](http://www.allthingsdistributed.com/2007/12/eventually_consistent.html)因为读者的帮助而得到了很大的改进。

原文链接：[http://www.allthingsdistributed.com/2008/12/eventually_consistent.html](http://www.allthingsdistributed.com/2008/12/eventually_consistent.html)
