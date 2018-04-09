#Plot 2
#Create a folder for my file
if (!file.exists("power"))
{
    dir.create("power")
}
#Read a file with data 
powerDF <- read.table("./power/power.txt", skip = 1, sep = ";")
#Add names a data frame 
names(powerDF) <- c("Date", "Time", "Global_acive_power", "Global_reactive_power", "Voltage",
                    "Gobal_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subsetting power consumation data
powerSub <- subset(powerDF, powerDF$Date == "1/2/2007" | powerDF$Date == "2/2/2007")
#Transformatig the variables "Data" and "Time" from characteres to POSIXlt
powerSub$Date <- as.Date(powerSub$Date, format= "%d/%m/%Y")
powerSub$Time <- as.Date(powerSub$Time, format = "%H:%M:%S")

powerSub[1:1440,"Time"] <- format(powerSub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powerSub[1441:2880,"Time"] <- format(powerSub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Calling the plot function 
plot(powerSub$Time, as.numeric(as.character(powerSub$Global_acive_power)), type = "1", xlab ="", ylab ="Global Active Power (Kilowats)")
#Put a Title
title(main="Global Active Power Vs Time")

#Save of plot in png
png("plot2.png", width=480, height=480)
dev.off()
