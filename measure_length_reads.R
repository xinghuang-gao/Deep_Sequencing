# measure the length of the sequence and increment the arry to the length by the awk command
#cat /Users/Maria/Desktop/XGAO/ctl_sickle.fq | awk '{if(NR%4==2) print length($1)}' | sort -n | uniq -c > sickle_length.txt
#plot the figure in R as follows

reads<-read.csv(file="~file path/read_length.txt", sep="", header=FALSE)
plot (reads$V2,reads$V1,type="l",xlab="read length",ylab="occurences",col="blue", xlim=c(20,60))
