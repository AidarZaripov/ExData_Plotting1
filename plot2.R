getwd()

### Set working directory
setwd("C:/Users/miair/datasciencecoursera/household_power_consumption")



### Firstly read the 'Date' column only and extract rows with "2007-02-01" and "2007-02-02"
f<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
              colClasses = c(rep("character", 1), rep("NULL", 8)))
f$Date<-as.Date(f$Date, format = "%d/%m/%Y")
w<-which(f$Date == "2007-02-01" | f$Date == "2007-02-02")

### Then read two whole table ("2007-02-01" and "2007-02-02")
g<-read.table("household_power_consumption.txt", sep = ";", skip=min(w), nrows = length(w))
colnames(g)<-colnames(read.table("household_power_consumption.txt", sep = ";", 
                                 nrows = 1, header = TRUE))
g$Datetime<-strptime(paste(g$Date, g$Time), format="%d/%m/%Y %H:%M:%S")

### Check the plot
plot(g$Datetime,g$Global_active_power, pch="", xlab = "", ylab="Global Active Power (kilowatts)")
lines(g$Datetime,g$Global_active_power)


### Write the plot into PNG file
png(filename = "plot2.png",width = 480, height = 480)

plot(g$Datetime,g$Global_active_power, pch="", xlab = "", ylab="Global Active Power (kilowatts)")
lines(g$Datetime,g$Global_active_power)

dev.off()


