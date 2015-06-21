main <- function() {
  library(data.table)
  dir1_   <- ".\\UCI HAR Dataset\\test\\X_test.txt"  
  test_data <- read.table(dir1_)
  dir2_   <- ".\\UCI HAR Dataset\\train\\X_train.txt"  
  train_data <- read.table(dir2_)
  data <- merge(train_data, test_data, all=TRUE)

  dir1_ <- ".\\UCI HAR Dataset\\features.txt"
  labels <- read.table(dir1_)
  labels <- labels[2]
  
  #setnames(test_data, c(t(labels)))
  #test = as.data.table(c(paste(rep("test",length(row.names(test_data)), collapse=''))  ))
  #setnames(test, 'Activity')
  #test_data <- cbind(test_data, test)
  #setnames(train_data, c(t(labels)))
  #train = as.data.table(c(paste(rep("train",length(row.names(train_data)), collapse=''))  ))
  #setnames(train, 'Activity')
  #train_data <- cbind(train_data, train)
  #data <- rbind(train_data, test_data)
  
  data_final <- cbind(labels, as.data.frame(colMeans(data[(data$Activity=="train"),1:561]))[,1], as.data.frame(colMeans(data[(data$Activity=="test"),1:561]))[,1])
  setnames(data_final, c('Subject', 'train', 'test'))
  
  data_final
}
