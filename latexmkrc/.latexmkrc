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
# Generate pdf using divpdf (-pdf)
# $pdf_mode = 3;

#xelatex
$pdf_mode = 5;

# Use bibtex if a .bib file exists $bibtex_use = 1; Define command to compile with pdfsync support and nonstopmode $pdflatex = "pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$xelatex = "xelatex -pvc -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";

#bib
$bibtex = "bibtex %O %S";
$biber = "biber %O %S";
# 0: 用bibtex或biber;清空的时候不会清空.bbl文件
# 1: 只有bib文件存在才使用bibtex或biber;清空的时候不会清空.bbl文件
# 1.5: 只有bib文件存在才使用bibtex或biber;当bib文件存在时会清空.bbl文件,否则不会清空
# 2: 有必要更新bbl文件时，运行bibtex或biber,无需测试bib文件是否存在;清空删除.bbl文件,否则不会清空
$bibtex_use = 2;


# Use default pdf viewer (Skim)
$preview_mode = 1;
# $new_viewer_always = 0;
# $pdf_update_method = 2;
$pdf_previewer = "start zathura --fork";

# zhmakeindex
@generated_exts = (@generated_exts, 'synctex.gz');
@cus_dep_list = (@cus_dep_list, "glo gls 0 makenomenclature");
sub makenomenclature {
  system("zhmakeindex -s zh.ist -t '$_[0]'.glg -o '$_[0]'.gls '$_[0]'.glo");
}
@generated_exts = (@generated_exts, 'glo gls glg acn acr alg');
$makeindex = 'zhmakeindex -z pinyin -s zh.ist';

# Also remove pdfsync files on clean
$clean_ext = 'pdfsync synctex.gz bbl nav out snm idx ind glg glo gls slo sls';
