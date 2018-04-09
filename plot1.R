#Plot 1
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
#Create a barplot 
hist(as.numeric(as.character(powerSub$Global_acive_power)),col = "red", 
     main = "Global Active Power", xlab = "Global Active Power(Kilowatts)", ylab = "Frecuency")
#Save the histograma with format png and resolution
png("plot1.png", width=480, height=480)
#Close of histograma
dev.off()



