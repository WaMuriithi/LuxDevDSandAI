# Hypothesis testing in Python

## Introduction
Data science is an interdisciplinary field integrating concepts from applied statistics, data analysis, and computer science to get the best out of the terabytes of data we generated daily.

Many people would like to hear the last about statistics – the subject rekindles bad memories of high school mathematics. It doesn’t have to be that way. Learning and using statistics in data science is not only fun but a lot easier as Python and R, the most common programming languages in data science, provide intuitive, agile, and fast methods to perform calculations that the best scientific calculator can only dream of. The programming languages provide tools to simulate any imaginable distribution for students to practice statistical concepts and understand the subject inside out. 

At the center of statistics is **hypothesis testing** – the branch of statistics that data scientists to draw sound conclusions from the data. Hypotheses testing allow media houses and polling companies to make statements like four out of five MAGA supporters lack a college degree or one I picked from an old Readers Digest article: Americans get called by robots as much as they do by humans. 

## What is hypothesis Testing?
Hypothesis testing lets you determine if the summary finding you have obtained after your analysis (the test statistic) proves your assumption(s) or it is within the expected normal range (the null hypothesis). Hypothesis testing ensures conclusions made after analyses are based on the data, rather than assumptions and insinuations that are prone to bias and abuse by powerful agents.

### Steps in Hypothesis Testing 
Hypothesis testing generally follows five steps:
1.	 **Define the null and alternative hypotheses**
	- The **null hypothesis (H<sub>O</sub>)** is default/no effect/no difference position
	- The **alternative hypothesis (H<sub>1</sub>)** is what you aim to prove.
2.	**Choose the significance level (α)**
	- This is the threshold for rejecting the null hypothesis. Test statistics (explained in step 4) with a probability of occurrence lower than the significance level are very rare. Most tests use a significance level of 0.05. 
3.	**Collect and analyze data**
	- Obtain and preprocess data for statistical analysis by removing null values, duplicates and outliers.
4.	**Calculate the test statistic or the p-value**
	- This is a summary of the dataset that you use to perform the hypothesis test. 
	- The choice of the test statistic depends on the data and hypothesis you seek to test.
5.	**Compare the test statistic with critical value or the p-value and α and interpret the findings**
	- Statisticians of yore used tables to determine critical values; Python and R allow you to calculate with one line of code
	- If the test statistic is larger than the critical value (for a right-tailed tests) or p-value is less than α, you reject the null hypothesis.
	- Otherwise fail to reject the null hypothesis.
## Implementing in Python
We will compare the means of two groups, such as the average scores of two streams of a class on the same subject to determine the difference in mean scores for the to classes is statistically significant. We will generate scores using Numpy, the numerical python API that is indispensable in data science and perform a t test using SciPy (Scientific Python), another important API for statistical analysis.
Test statistics falling in the critical region demarcated by the critical value or the α are considered statistically significant. 

### **Import Required Libraries**
```python
import numpy as np
from scipy import stats
import pandas as pd
```

### **Generate Sample Data**
```python
# Set seed for reproducibility
np.random.seed(42)

# Generate random exam scores for two classes
class_A = np.random.normal(loc=75, scale=10, size=25)  # Mean 75, Std Dev 10
class_B = np.random.normal(loc=80, scale=10, size=25)  # Mean 80, Std Dev 10
```

### **Perform an Independent t-Test**
```python
# Conduct an independent t-test
stat, p_value = stats.ttest_ind(class_A, class_B)

print(f"T-statistic: {stat:.3f}")
print(f"P-value: {p_value:.3f}")

# Interpret the results
alpha = 0.05  # Significance level
if p_value < alpha:
    print("Reject the null hypothesis: There is a significant difference in performance between the two classes.")
else:
    print("Fail to reject the null hypothesis: No significant difference between the two classes.")
```

Please note statistical significance is not the same as practical importance. A statistically significant difference in the pain scores in groups taking different painkillers does not mean that one drug reduces pain and the other doesn’t. How meaningful the difference will be the subject of another article on effect size.

## Conclusion
Hypothesis testing is an essential method in data analysis and science that enables sound decisions based on the data. Python provides several libraries and functions to perform hypothesis testing for groups with few or millions of observations. With just a few lines of code, Python permits the testing of null and alternative hypotheses, ensuring the data speaks for itself. 

