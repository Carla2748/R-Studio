#Getting file from my local
db <- data.table::fread(input = "household_power_consumption.txt"
                        , na.strings="?")
head(db)

#Changing the data format so it shows as numbers instead of exponential
db[, Global_reactive_power := lapply(.SD, as.numeric), .SDcols = c("Global_reactive_power")]

#Fixing the datetime format
db[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


#Creating a new data set with filter of days needed
db1 <- db[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Creating the plot
png("plot4.png", width=480, height=480)

#To get the 2x2 format
par(mfrow=c(2,2))

#Plot1
plot(x = db1[, dateTime]
     , y = db1[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Plot2
plot(x = db1[, dateTime], y = db1[, Sub_metering_1], type="l", xlab="", ylab="Energy Sub metering")
lines(x = db1[, dateTime], y = db1[, Sub_metering_2],col="red")
lines(x = db1[, dateTime], y = db1[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot3
plot(x = db1[, dateTime]
     , y = db1[, Voltage]
     , type="l", xlab="", ylab="Voltage")

#Plot4
plot(x = db1[, dateTime]
     , y = db1[, Global_reactive_power]
     , type="l", xlab="", ylab="Global Reactive Power")



dev.off()