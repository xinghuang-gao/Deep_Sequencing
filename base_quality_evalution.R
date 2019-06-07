#Evaluate quality profiles of illum sequences in R with Bioconductor
# package qrqc
#install  library bioconductor in r
library(BiocInstaller)
bioClite('qrqc')
#go to the terminal to install seqtk and sickle used to trim low-quality bases
# $brew install seqtk and brew install sickle
# trim the assigned fastq.gz file by sickle running in the terminal
#$ sickle se -f ~/contorl.fq -t sanger -o ctl_sickle.fq
# trim the assigned fastq.gz file by trimfq running in the terminal
# $ seqtk trimfq control.fq > ctl_trimfq.fq #cannot use gz compressed files, gz file needs to be decompressed by gunzip in the terminal.
# $gzip file.fq
#compre these results in R 
# trim_qual.r
library(qrqc)
#FASTQ filles
fqfiles <- c(none ="~/control.fq.gz", sickle = "~/ctl_sickle.fq.gz", trimfq = "~/ctl_trimfq.fq.gz")


#load each file in using qrqc readseqfile
#need only qualities, some features from readSeqFile turn off

seq_info <- lapply(fqfiles,function(file) {
	readSeqFile(file, hash =FALSE, kmer=FALSE)
})

#extract the qualiteis as df , and append a column of which trimmer was used
quals<- mapply(function(sfq,name) {
  qs <- getQual(sfq)
  qs$trimmer <-name
  qs
  }, seq_info, names(fqfiles),SIMPLIFY=FALSE)
  
 #combine df in a list into single df
d <-do.call(rbind,quals)

# Visualize qualities
p1 <- ggplot(d)+geom_line(aes(x=position, y=mean, linetype=trimmer))
p1  <-p1+ylab("mean quality(sanger)")+theme_bw()
print(p1)

#use qrqc's qualplot with list produxes panel plots
#only shows 10% to 90% quantiles and lowess curve
p2 <- qualPlot(seq_info,quartile.color = "grey", mean.color=NULL)+theme_bw()
p2 <- p2 + scale_y_continuous("quality(sanger)")
print(p2)
