library(micromapST)
#libs for histogram
library(ggplot2)
library(dplyr)


uterus_data <- read.csv("C:\\Users\\Replace with Path to csv file\\uteruscancer_1_.csv")

str(uterus_data)
panelDesc <- data.frame(
  type = c('maptail', 'id', 'dotconf', 'dotconf'),
  lab1 = rep("", 4),
  lab2 = c(NA, NA, 'Age.Adjusted.Death.Rate', 'Recent.5.Year.Trend'),
  lab3 = c(NA, NA, 'Confidence Intervals(Percent)', 'Confidence Intervals(Percent)'),
  col1 = c('State', 'State', 'Age.Adjusted.Death.Rate', 'Recent.5.Year.Trend'),
  col2 = c(NA, NA, 'Lower.95..CI', 'Lower.95..CI.Trend'),
  col3 = c(NA, NA, 'Upper.95..CI', 'Upper.95..CI.Trend')
)

#pdf()
pdf(file= "C:\\Users\\Replace with Path to save pdf file\\testFile.pdf",width=7.5,height=10)

micromapST(uterus_data,
           panelDesc,
           rowNamesCol = 'State',
           rowNames = 'full',
           sortVar = 'Recent.5.Year.Trend',
           ascend = FALSE,
           title = c("Uterus Cancer Female Cases Overview"),
           ignoreNoMatches = TRUE)
set.seed(5678)
x <- rchisq(n=10000, df=10)
head(x)
y <- qchisq(p = .99, df = 10)
y
ct <- length(which(x > y))
ct				
(ct / length(x > y)) * 100

a1 <- ggplot() +
  geom_histogram(aes(x), bins = 50, size = 1.5)
fill <- c("blue")
p1 <- a1 + labs(x="x Values", y="y values") + ggtitle("Histogram with density plot")
p1

dev.off()

