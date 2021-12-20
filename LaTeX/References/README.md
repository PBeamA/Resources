# References
Different LaTeX citation styles using `biblatex` and `biber`.

Usage:
- Reference `.bib` files must have the same name as the main `.tex` file
  - `\jobname.bib` is used to import the `.bib` file
- `\citeauthoryear{}` is used to place intext citations in the form of Author (year)
  - `\citeauthorsyear{}` Author's (year)
  - `\citeauthorssyear{}` Author' (year)


`.bib` file notes:
- The case of the title can be forced using `{}`
  - E.g. `{New Zealand}` or `{N}ew {Z}ealand`
