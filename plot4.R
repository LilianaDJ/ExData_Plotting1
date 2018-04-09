#Plot 4
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
#Calling a plot
with(powerSub,{
    plot(powerSub$Time,as.numeric(as.character(powerSub$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
    plot(powerSub$Time,as.numeric(as.character(powerSub$Voltage)), type="l",xlab="datetime",ylab="Voltage")
    plot(powerSub$Time,powerSub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    with(powerSub,lines(Time,as.numeric(as.character(Sub_metering_1))))
    with(powerSub,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
    with(powerSub,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
    plot(powerSub$Time,as.numeric(as.character(powerSub$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
#Save plot
dev.copy(png, file="plot4.png", height=480, width=480)
#Close de plot
dev.off()

