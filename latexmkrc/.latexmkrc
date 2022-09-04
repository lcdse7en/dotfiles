# LaTeXmk configuration file

# Usage example
# latexmk file.tex

# Main command line options
# -pdf : generate pdf using pdflatex
# -pv  : run file previewer
# -pvc : run file previewer and continually recompile on change
# -C   : clean up by removing all regeneratable files

# Generate pdf using pdflatex (-pdf)
# $pdf_mode = 1;

#xelatex
$pdf_mode = 5;

# Use bibtex if a .bib file exists
$bibtex_use = 1;

# Define command to compile with pdfsync support and nonstopmode
$pdflatex = "pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$xelatex = "xelatex -pvc -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";

# Use default pdf viewer (Skim)
$preview_mode = 1;
# $new_viewer_always = 0;
# $pdf_update_method = 2;
$pdf_previewer = "start zathura --fork";

# Also remove pdfsync files on clean
$clean_ext = 'pdfsync synctex.gz';
