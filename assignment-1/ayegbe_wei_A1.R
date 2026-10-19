# Q1.1 Data quality (4 points) (Han Ex. 3.1). Name four dimensions of data quality covered in class (e.g.
# accuracy, completeness). For two of them, give an example where the same dataset is good enough for
# one use but not for another.




# Q1.2 Missing values (4 points) (Han Ex. 3.2). Describe four methods for handling tuples with missing
# values. For each, give one situation where it is a poor choice (hint: the fraud detection example from
# Lecture 2).



ages <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)

# Q1.3 Descriptive statistics (6 points)

# 1. Compute the mean, median and midrange. (1.5)
q1_mean <- mean(ages)
q1_median <- median(ages)
q1_midrange <- (max(ages) + min(ages)) / 2

print(paste("Mean:", q1_mean))
print(paste("Median:", q1_median))
print(paste("Midrange:", q1_midrange))

# 2. Give the mode(s) and state the data's modality. (1)
q1_mode <- names(sort(-table(ages)))[1]

print(paste("Mode:", q1_mode))

# 3. Find Q1 and Q3 and give the five-number summary. (1.5)
q1_q1 <- quantile(ages, 0.25)
q1_q3 <- quantile(ages, 0.75)
q1_five_number_summary <- fivenum(ages)

print(paste("Q1:", q1_q1))
print(paste("Q3:", q1_q3))
print(paste("Five-number summary:", paste(q1_five_number_summary, collapse = ", ")))

# 4. Draw a boxplot (by hand or with boxplot()) and say, using the 1.5 × IQR rule, whether any value is an outlier. (2) ( you will need to do some research to understand with is Q1, Q2 and IQR)
png_file <- file.path(getwd(), "boxplot.png")

png(filename = png_file, width = 800, height = 600)
boxplot(ages, main = "Boxplot", range = 1.5)
dev.off()

print(file.exists(png_file))
print(png_file)

# Q1.4 Transformation (6 points)

# 1. Smooth the data by bin means using equal-frequency bins of depth 3. Show the bins. (2)
bins_equal_frequency <- split(ages, ceiling(seq_along(ages) / 3))

print("Bins with equal-frequency:")
print(bins_equal_frequency)


# 2. Partition the data into 3 equal-width bins. Give the bin boundaries and counts, and say which
# binning method better represents this data and why. (2)
bins_equal_width <- split(ages, cut(ages, breaks = 3))

print("Bins with equal-width:")
print(bins_equal_width)

# TODO: Compare the two binning methods and explain which one better represents the data and why.



# 3. Normalize age = 35 using min-max normalization to [0, 1], and using z-score normalization (use
# the sample standard deviation). (2)
age35_to_0_1 <- (35 - min(ages)) / (max(ages) - min(ages))
age35_z_score <- (35 - mean(ages)) / sd(ages)

print(paste("Min-max normalization of age 35:", age35_to_0_1))
print(paste("Z-score normalization of age 35:", age35_z_score))

