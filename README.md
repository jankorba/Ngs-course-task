# **Ngs-course-task**
## **Description**
#### As the final exam, I chose the task number 10. In this task, I had to correlate the PHRED quality score and read depth (DP).

## **Run the pipeline**
##### First, I prepared a new directory in my local directory for this task.
```mkdir final_task```

##### Then, I copied the data from the shared directory to my recently created directory.
```cp /data-shared/vcf_examples/luscinia_vars.vcf.gz /home/user18/final_task```

##### I had to gunzip the file.
```gunzip luscinia_vars.vcf.gz```

##### Now, I removed the headers which started with # symbol using ```grep``` function and created new file with removed headers
```</home/user18/final_task/luscinia_vars.vcf | grep -v "^#" >/home/user18/final_task/no-headers.vcf```

##### Now, I used the created file as an input and used functions ```egrep``` and ```sed``` to extract the "DP" column.
```IN=no-headers.vcf <$IN egrep -o "DP=[^;]*" | sed "s/DP=//" > col-dp.tsv```

##### Now, I used once again the defined input to extract the sixth column (PHRED).
```<$IN cut -f 6 > col_phred.tsv```

##### Finally, I merged both extracted columns into one singe file delimited by tab.
```paste col-dp.tsv col_phred.tsv  > col_both.tsv```

##**Switch to R**
##### First, I set the current working directory.
```> setwd("~/final_task")```

##### Then, I had to load th library.
```> library(tidyverse)```

##### Now, I had to load the file and define column names.
```> read_tsv("col_both.tsv", col_names = c ("DP", "PHRED")) -> d```

##### Finally, I plot the graph defining which variable I want on which axis.
```> ggplot(d, aes(x = PHRED, y = DP)) + geom_point()```

### **Show the graph**
![Graph showing correlation between Phred quality score and read depth](https://www.flickr.com/photos/23206893@N05/51804819482/in/dateposted/)








