library (ggplot2)

GG <- read.csv(file="C:\\Users\\coope\\OneDrive\\Desktop\\Professional\\gabor_granger_data.csv")

GG_table = as.data.frame(table(GG$Max_Price))                       
colnames(GG_table) = c("price","count")                             
GG_table$price = as.numeric(as.character(GG_table$price))

barplot(GG_table$count, names.arg = GG_table$price, xlab="price", ylab="counts")

GG_table = GG_table[order(GG_table$price, decreasing = TRUE),]      
row.names(GG_table) <- NULL                                         

GG_table$demand = cumsum(GG_table$count)

GG_table$cumulativepercent = GG_table$demand/sum(GG_table$count)

GG_table$revenue = GG_table$price*GG_table$demand

GG_table

plot(GG_table$price, GG_table$demand, type = "b",  col = "blue",  pch=19, xlab = "price", 
     ylab = "demand", main="Gabor-Granger Demand curve")

plot(GG_table$price, GG_table$revenue, type = "b",  col = "red",lwd=4, pch=19, xlab = "price",
     ylab = "revenue", main="Gabor-Granger revenue curve")