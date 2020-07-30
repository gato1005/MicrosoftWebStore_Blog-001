# Download the file form the given URL
# https://www.kaggle.com/vishnuvarthanrao/windows-store/download",destfile 

# unzip the file in working directory
unzip(zipfile = "761595_1314449_bundle_archive.zip",exdir =".")

# read the csv file
msft_df<-read.csv(file = "msft.csv",
                  header = TRUE,
                  sep = ",")
