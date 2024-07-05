# BAA5063 Business Statistics Using R 
# Individual Assignment
# Student Name: Yon Hui Yi
# Student ID: 20022992
# Topic: Enhancing Business Performance through Coffee Bean Sales Analysis 


# Data Access-----
library(readxl)
salesdata <- read_excel("coffeebeansales.xlsx", na = "NA")
View(salesdata)


# Data Preprocessing-----
## 1. Identify and Remove Missing Value
which(is.na(salesdata))

## 3. Data Transformation
### Get data structure information
str(salesdata)

### Transform data type 
salesdata$Country<-as.factor(salesdata$Country)
salesdata$Loyalty.card<-as.factor(salesdata$Loyalty.card)
salesdata$Year<-as.factor(salesdata$Year)
salesdata$Coffee.type<-as.factor(salesdata$Coffee.type)
salesdata$Roast.type<-as.factor(salesdata$Roast.type)
str(salesdata)
                              
  
## 4.Convert data from tibble to Data Frame
sales_df<-as.data.frame(salesdata)
sales_df


# Analysis-----
## Part 1. Data Summary Statistics 
summary(sales_df)
var(sales_df$Sales)
sd(sales_df$Sales)
var(sales_df$Size)
sd(sales_df$Size)


## Part 2. Analyzing Product Performance:-----
### 1. Sales by Coffee Type and Roast Type
# Sequence the coffee type data by sales
sales_df$Coffee.type <- reorder(sales_df$Coffee.type, -sales_df$Sales)

# Sequence the roast type data by sales
sales_df$Roast.type <- reorder(sales_df$Roast.type, -sales_df$Sales)

# Create bar chart
library(ggplot2)
ggplot(sales_df, aes(x = Coffee.type, y = Sales, fill = Roast.type)) +
  geom_bar(stat = "identity") +
  labs(title = "Sales by Coffee Type and Roast Type", x = "Coffee Type", y = "Sales") +
  scale_fill_discrete(name="Roast Type") +
  theme_minimal()


### 2. Sales by Size Grouped by Coffee Type
# Sequence the size data by sales
sales_df$Size <- reorder(sales_df$Size, -sales_df$Sales)

# Create bar chart: 
library(ggplot2)
ggplot(sales_df, aes(x = Size, y = Sales, fill = Coffee.type)) +
  geom_bar(stat = "identity") +
  labs(title = "Sales by Size Grouped by Coffee Type", x = "Size", y = "Sales") +
  scale_fill_discrete(name="Coffee Type") +
  theme_minimal()

### 3. Sales by Country Grouped by Coffee Type
# Sequence the country data by sales
sales_df$Country <- reorder(sales_df$Country, -sales_df$Sales)

# Create bar chart: 
library(ggplot2)
ggplot(sales_df, aes(x = Country, y = Sales, fill = Coffee.type)) +
  geom_bar(stat = "identity") +
  labs(title = "Sales by Country Grouped by Coffee Type", x = "Country", y = "Sales") +
  scale_fill_discrete(name="Coffee Type") +
  theme_minimal()

### 4. Sales by Year Grouped by Coffee Type
# Create bar chart: 
library(ggplot2)
ggplot(sales_df, aes(x = Year, y = Sales, fill = Coffee.type)) +
  geom_bar(stat = "identity") +
  labs(title = "Sales by Year Grouped by Coffee Type", x = "Year", y = "Sales") +
  scale_fill_discrete(name="Coffee Type") +
  theme_minimal()

## Part 3. Top 50 Customer Preferences Identification:-----
### Get the Top 50 Customers by Sales
# Order the data frame by Sales in descending order
sorted_sales <- sales_df[order(-sales_df$Sales), ]
  
# Get the top 50 customers
top_50 <- head(sorted_sales, 50)

### 1. Top 50 Customers by Coffee Type and Roast Type
# Create bar chart
library(ggplot2)
ggplot(top_50, aes(x = top_50$Coffee.type, y = top_50$Sales, fill = top_50$Roast.type)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 50 Customers by Coffee Type and Roast Type", x = "Coffee Type", y = "Sales") +
  scale_fill_discrete(name = "Roast Type") +
  theme_minimal()

# Create Cross Tabulation Table
library(sjPlot)
tab_xtab(var.row=top_50$Coffee.type,var.col=top_50$Roast.type,show.row.prc = TRUE)


### 2. Top 50 Customers by Loyalty Card Grouped by Coffee Type
# Create bar chart
library(ggplot2)
ggplot(top_50, aes(x = top_50$Loyalty.card, y = top_50$Sales, fill = top_50$Coffee.type)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 50 Customers by Loyalty Card Grouped by Coffee Type", x = "Loyalty Card", y = "Sales") +
  scale_fill_discrete(name = "Coffee Type") +
  theme_minimal()

### 3. Top 50 Customers by Country Grouped by Coffee Type
# Create bar chart
library(ggplot2)
ggplot(top_50, aes(x = top_50$Country, y = top_50$Sales, fill = top_50$Coffee.type)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 50 Customers by Country Grouped by Coffee Type", x = "Country", y = "Sales") +
  scale_fill_discrete(name = "Coffee Type") +
  theme_minimal()

