#Getting file from my local
db <- data.table::fread(input = "household_power_consumption.txt"
                        , na.strings="?")
head(db)


#Fixing the datetime format
db[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


#Creating a new data set with filter of days needed
db1 <- db[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Creating the plot
png("plot3.png", width=480, height=480)

plot(x = db1[, dateTime], y = db1[, Sub_metering_1], type="l", xlab="", ylab="Energy Sub metering")
lines(x = db1[, dateTime], y = db1[, Sub_metering_2],col="red")
lines(x = db1[, dateTime], y = db1[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

