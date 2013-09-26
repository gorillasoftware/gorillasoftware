---
title: Overview of available ruby markdown libraries
published: false
---

### Requisites

* Support for tables
* Active development
* Support for Latex/PDF export (alternative via HTML, optional)
* Native markdown support for id/class (optional)
* Pure ruby (no C extensions, optional)

READMORE

| Candidates                  | tables   | pdf   | pure ruby      | Active development   | License | Remarks  |
| ----------                  | :------: | :---: | :------------: | :------------------: | ------- | -------: |
| Github Markdown [↩][ghmd]   |          |       | ✓              | ✓                    | MIT     | 1        |
| ~~Markup~~ [↩][markup]      |          |       | ✓              | ✘                    |         |          |
| Redcarpet [↩][redcarpet]    | ✓        |       | ✓              | ✓                    |         | 1, 2     |
| RDiscount [↩][rdiscount]    |          |       | ✘              | ✓                    | BSD     | 3        |
| Bluecloth [↩][bluecloth]    |          |       | ✓              | ✘                    |         |          |
| Bluecloth 2 [↩][bluecloth2] |          |       | ✓              | ✘                    |         |          |
| kramdown [↩][kramdown]      | ✓        | ✓     | ✓              | ✓                    | MIT     |          |
| Maruku [↩][maruku]          |          | ✓     | ✓              | ✓                    | MIT     | 4        |

Non-ruby implementations

| Candidates                       | tables   | pdf   | pure ruby      | Active development   | License | Remarks  |
| ----------                       | :------: | :---: | :------------: | :------------------: | ------- | -------: |
| pandoc-markdown [↩][pandoc]      |          |       |                |                      |         |          |
| MultiMarkdown [↩][multimarkdown] |          |       |                |                      |         |          |

## Remarks
1. Redcarpet is the Github Markdown rendering library used in Github Markdown
2. This document is a markdown file rendered with Redcarpet (via Middleman), see [here][1]
3. RDiscount is a wrapper for Discount (Discount is an implementation of John Gruber's Markdown markup language in C)
4. Support for tables via inline HTML


[1]: https://github.com/gorillasoftware/gorillasoftware/blob/master/source/blog/2013-09-19-ruby-markdown-libraries.markdown

[ghmd]: https://github.com/github/markup
[markup]: https://github.com/jameswilding/markup
[redcarpet]: https://github.com/vmg/redcarpet
[rdiscount]: https://github.com/davidfstr/rdiscount
[bluecloth]: https://github.com/mislav/bluecloth/
[bluecloth2]: https://github.com/ged/bluecloth
[kramdown]: https://github.com/gettalong/kramdown
[maruku]: https://github.com/bhollis/maruku

[pandoc]: http://johnmacfarlane.net/pandoc/
[multimarkdown]: http://fletcherpenney.net/multimarkdown/
