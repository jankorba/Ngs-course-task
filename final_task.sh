#make directory
mkdir final_task

#copy file to my directory
cp /data-shared/vcf_examples/luscinia_vars.vcf.gz /home/user18/final_task

#gunzip file
gunzip luscinia_vars.vcf.gz

#remove headers
</home/user18/final_task/luscinia_vars.vcf | grep -v "^#" >
/home/user18/final_task/no-headers.vcf

#extract DP
IN=no-headers.vcf
<$IN egrep -o "DP=[^;]*" | sed "s/DP=//" > col-dp.tsv

#extract phred
<$IN cut -f 6 > col_phred.tsv

#merge both columns to one file
paste col-dp.tsv col_phred.tsv  > col_both.tsv


