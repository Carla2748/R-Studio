#Getting file from my local
db <- data.table::fread(input = "household_power_consumption.txt"
                        , na.strings="?")
head(db)

#Changing the data format so it shows as numbers instead of exponential
db[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Fixing the datetime format
db[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


#Creating a new data set with filter of days needed
db1 <- db[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Creating the plot
png("plot2.png", width=480, height=480)

plot(x = db1[, dateTime]
     , y = db1[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
