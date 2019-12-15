data <- readLines("data/memo.txt", encoding = "UTF-8")
data <- data[nchar(data)>0]
data[1] <- gsub("[&$#!@%]","",data[1])
data[2] <- gsub("e","E",data[2])
data[3] <- gsub("[12]","",data[3])
data[4] <- gsub("[A-z]","",data[4])
data[5] <- gsub("[!12345678<>]","",data[5])
data[6] <- gsub(" ","",data[6])
data[7] <- gsub("YOU","you",data[7])
data[7] <- gsub("OK","ok",data[7])
data
write(data,"memo_new.txt")

