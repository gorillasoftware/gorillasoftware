---
title: Overview of available ruby markdown libraries
---

![Markdown in in iA Writer](/blog/2013-09-19-ruby-markdown-libraries/teaser.gif)
<small>Markdown text in iA Writer</small>

I was confronted by the technology decision lately of chosing a ruby
markdown library for a Rails project. The following overview was mostly
of personal interest, but may be helpful for other people too. READMORE
For errata or missing libraries please contact me via the comments form.

These were my requisites

* Support for tables
* Active development
* Support for Latex/PDF export (alternative via other markup language) <sup>A</sup>
* Native markdown support for id/class <sup>A</sup>
* Pure ruby (no C extensions) <sup>A</sup>

<sup>A</sup> optional

READMORE

| Candidates                  | tables   | pdf   | pure ruby      | Active development<sup>B</sup>   | License | Remarks  |
| ----------                  | :------: | :---: | :------------: | :------------------: | ------- | -------: |
| Github Markup [↩][ghmd]     |          |       | ✓              | ✓                    | MIT     | 1        |
| ~~Markup~~ [↩][markup]      |          |       | ✓              |                      |         |          |
| Redcarpet [↩][redcarpet]    | ✓        |       | ✓              | ✓                    |         | 1, 2     |
| RDiscount [↩][rdiscount]    |          |       |                | ✓                    | BSD     | 3        |
| Bluecloth [↩][bluecloth]    |          |       | ✓              |                      |         |          |
| Bluecloth 2 [↩][bluecloth2] |          |       | ✓              |                      |         |          |
| kramdown [↩][kramdown]      | ✓        | ✓     | ✓              | ✓                    | MIT     |          |
| Maruku [↩][maruku]          |          | ✓     | ✓              | ✓                    | MIT     | 4        |

#### Non-ruby implementations

| Candidates                                                                         | tables   | pdf   | pure ruby      | Active development<sup>B</sup> | License | Remarks  |
| ----------                                                                         | :------: | :---: | :------------: | :----------------------------: | ------- | -------: |
| pandoc-markdown [↩][pandoc]                                                        | ✓        | ✓     | -              | ✓                              | GPL     |          |
| MultiMarkdown [↩][multimarkdownpl] <br>(aka MultiMarkdown.pl)                      | ✓        | ✓     | -              |                                |         |          |
| MultiMarkdown [↩][multimarkdownv3] <br>(aka peg-multimarkdown or MultiMarkdown v3) | ✓        | ✓     | -              |                                |         |          |
| MultiMarkdown 4 [↩][multimarkdownv4]                                               | ✓        | ✓     | -              | ✓                              | GPL/MIT |          |

## Remarks

1. Redcarpet is the Github Markdown rendering library used in Github Markdown
2. This document is a markdown file rendered with Redcarpet (via Middleman), see [here][1]
3. RDiscount is a wrapper for Discount (Discount is an implementation of John Gruber's Markdown markup language in C)
4. Support for tables via inline HTML

<sup>B</sup> I presume a project with multiple commits to the project repository in the last 12
months as in active development.

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
[multimarkdownpl]: https://github.com/fletcher/MultiMarkdown
[multimarkdownv3]: https://github.com/fletcher/peg-multimarkdown
[multimarkdownv4]: https://github.com/fletcher/MultiMarkdown-4
