#Getting file from my local
db <- data.table::fread(input = "household_power_consumption.txt"
                        , na.strings="?")
head(db)

#Changing the data format so it shows as numbers instead of exponential
db[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Fixing the date format
db[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Creating a new data set with filter of days needed
db1 <- db[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Creating the plot
png("plot1.png", width=480, height=480)

hist(db1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
        ylab="Frequency", main="Global Active Power")

dev.off()
