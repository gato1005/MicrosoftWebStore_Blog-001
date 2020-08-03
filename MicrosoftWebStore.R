# Download the file form the given URL
# https://www.kaggle.com/vishnuvarthanrao/windows-store/download"

# unzip the file in working directory
unzip(zipfile = "761595_1314449_bundle_archive.zip",exdir =".")

# read the csv file
msft_df<-read.csv(file = "msft.csv",
                  header = TRUE,
                  sep = ",")

# create a copy of the original data so if manipulateed, we still have a raw copy
msft_df_ori<-msft_df

# look the columss of the dataframe
colnames(msft_df)

# the last record looks waste so we remove it
msft_df<-msft_df[1:5321,]

# get general information on the columns
summary(msft_df)

# Clearly some columns need modification
# The price Column must be integer/float
msft_df<-msft_df %>%
  mutate(Price=case_when(msft_df$Price=="Free"~"0",
                         TRUE~substring(msft_df$Price,first = 5)))
msft_df$Price<-gsub(",","",msft_df$Price)
msft_df$Price<-as.numeric(msft_df$Price)

# The data column must be date format
msft_df$Date<-as.Date(msft_df$Date,format = "%d-%m-%Y")
                      
# convert the colnames to lower case so they are easy to analyze and we dont
# mess up the initial capital letter
colnames(msft_df)<-tolower(colnames(msft_df))

# convert all the character columns to lower case so it is easier to analyze
msft_df$category<-tolower(msft_df$category)
msft_df$name<-tolower(msft_df$name)
