# MATLAB2LATEX

Originally used RStudio (R) + Knitr so that I could input variables straight
into LaTeX files. However there is no equivalent for MATLAB.

Found the package `datatool`, which does the job:
```
\usepackage{datatool}
\DTLsetseparator{ = }
\DTLloaddb[noheader, keys = {key,value}]{DATA}{MATLAB/DATA.txt}
\newcommand{\Sexpr}[1]{\protect \DTLfetch{DATA}{key}{#1}{value}}
```
To call a variable simply use `\Sexpr{__}`, as was done with RStudio+Knitr.
This worked... but it was slow.

To speed things up this function was written to convert files meant for
the "datatool" package and uses the same function `\Sexpr{__}` to call
values.

## Example
`DATA.txt`
```
  x = 1,234.321
  x2 = 1,234.321
```
`DATA.txt` -> `DATA.tex`

The value of `x` is `\Sexpr{x}`

The value of `x2` is `\Sexpr{x2}`

Output:

The value of `x` is `1,234.321`

The value of `x2` is `1,234.321`
