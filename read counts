# analysis-of-rna-seq-with-count-reads
###
analyze rna seq data with r and bioconductor. once sequencing reads being aliged to genome with Bowtie2 aligner, the bam file
sorted and indexed with samtools in order to visulaize in IGV. The sorted bam file is then converted back to sam file for counting 
read numbers for each gene by HTSeq (a python library) tool. the output of HTSeq file is txt and can be futher used for R and DESeq2.
####
ref1: https://www.huber.embl.de/pub/pdf/nprot.2013.099.pdf 
ref2: https://bioc.ism.ac.jp/packages/2.14/bioc/vignettes/DESeq2/inst/doc/beginner.pdf
ref3: https://www.bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html#htseq-count-input # DESeq2 tutoria
###
1. Install HTSeq python library in Mac OS
# you have conda set up, go as follows:
$ conda install -c bioconda HTSeq
$ htseq-count --help
# to check if the install is successful
$ python
>import numpy
> import pysam
> import matplotlib
> import HTSeq
