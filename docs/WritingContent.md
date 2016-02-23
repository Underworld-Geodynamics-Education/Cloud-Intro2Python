---
layout: home
title: How to Write Content
author: Louis Moresi
description: How to Write Content
---

_The content of the web pages that are used for documentation is built from markdown using `mkdocs` - which is a very simple format for building a static website from markdown content with a very lightweight configuration overhead. Markdown is also the format used to write content for notebooks. Mathematics is included as latex using simple `mathjax` tags but this does require a live internet connection_

# Overview

Standard `markdown` will be converted to `html` via `mkdocs`. These are parsed at the build stage. If you want to change the formatting of the website then it will be necessary to understand how this works in detail (themes / scripts etc). Otherwise, the following examples should be enough !

# Some example content

The usual [markdown formatting styles](https://daringfireball.net/projects/markdown/basics) work: _emphasis_, **bold** etc.

Lists are simple

   * they can include [links](www.google.com)
   * inline `code`
   * or even mathematical symbols / equations: \\( e^{i\pi} + 1 = 0 \\)

Numbered lists

   1. with [the other sort of links][RefLink]
   1. or formatted with `html` tags <i>like this</i>

[Reflink]: www.google.com  

The source code for the above section is:

``` markdown

The usual [markdown formatting styles](https://daringfireball.net/projects/markdown/basics)
work: _emphasis_, **bold** etc.

Lists are simple

   * they can include [links](www.google.com)
   * inline `code`
   * or even mathematical symbols / equations: \\( e^{i\pi} + 1 = 0 \\)

Numbered lists

   1. with [the other sort of links][RefLink]
   1. or formatted with `html` tags <i>like this</i>

[Reflink]: www.google.com  
```

# Mathematics

We can also include mathematics because the [mathjax](http://mathjax.readthedocs.org/en/latest/) scripts have already been included in the headers of all the web pages (and are also enabled by default in the notebook markdown cells).

Inline mathematics works by using `\\(` and `\\)` symbols (the escaped version of what would normally be used in \\( \LaTeX \\) ). Display equations use `\\[` and `\\]` but it is also possible to use `\begin{equation}` and `\end{equation}` (which also allows you to use equation numbers) and other environments.

\\[ A = \pi r ^ 2 \\]

\begin{equation}
    A = \pi r ^ 2  \label{eq:area-of-a-circle}
\end{equation}

The latter form also allows us to create references to any equation (e.g. equation \\( \ref{eq:area-of-a-circle} \\) ) in the current _page_ context.

The above paragraphs are rendered from:

``` markdown

Inline mathematics works by using `\\(` and `\\)` symbols
(the escaped version of what would normally be used in \\( \LaTeX \\) ).
Display equations use `\\[` and `\\]` but it is also possible to use
`\begin{equation}` and `\end{equation}` (which also allows you to use equation numbers)
and other environments.

\\[ A = \pi r ^ 2 \\]

\begin{equation}
    A = \pi r ^ 2  \label{eq:area-of-a-circle}
\end{equation}

The latter form also allows us to create references to any equation
(e.g. equation \\( \ref{eq:area-of-a-circle} \\) )
in the current _page_ context.
```

Mathjax is pretty smart but it does not get to see the web pages until they have been rendered by `mkdocs` and so sometimes things can go wrong. Equations which contain `_` and `*` may need to use extra whitespace to avoid being interpreted as emphasis marks. Use `\nonumber` instead of using the `*` form of mathematical environments. Things work surprisingly well but not every time !

# Code highlighting

The `jekyll` system renders code blocks which have been suitably tagged with `liquid`
markup. For example:

``` markdown
``` latex
 % Navier Stokes equation
 \frac{\partial {\bf u}}{\partial t}  +
 \left( {\bf u}. \nabla  \right) {\bf u}   =
 -\frac{1}{\rho } \nabla p  +  \textbf{F}  + \nu \nabla ^ 2 {\bf u}
 ` ``
```

produces

``` latex
% Navier Stokes equation
\frac{\partial {\bf u}}{\partial t}  +
\left( {\bf u}. \nabla  \right) {\bf u}   =
-\frac{1}{\rho } \nabla p  +  \textbf{F}  + \nu \nabla ^ 2 {\bf u}
```

aka

\begin{equation}
\frac{\partial {\bf u}}{\partial t}  +
\left( {\bf u}. \nabla  \right) {\bf u}   =
-\frac{1}{\rho } \nabla p  +  \textbf{F}  + \nu \nabla ^ 2 {\bf u}
\end{equation}

We can highlight code in exactly the same way

``` python

# Import the underworld system
import underworld as uw

# Take a look at the documentation
help(uw)

# Write some code
print "Hello Underworld"

```


# Some further reading

### Links

[Markdown Website](http://daringfireball.net/projects/markdown/)  
[Mathjax Website](http://docs.mathjax.org)  
[Jupyter Notebooks](http://www.jupyter.org)  
