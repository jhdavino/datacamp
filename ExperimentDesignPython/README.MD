# Experimental Design in Python
## Luke Hayden

# The Basics of Statistical Hypothesis Testing
- This course is going to teach us the basics of how to answer scientific questions.
- In this course, we'll be using the `plotnine` library.
- This uses the Grammar of Graphics approach to displaying and building graphs.
```python
import plotnine as p9

(
  p9.ggplot([<pandas-dataframe>]) +
  p9.aes(
    x = 'Variable to put on X-axis',
    y = 'Variable to put on Y-axis',
    color = 'variable'
  ) +
  p9.geom_point()
)
```
- **Scatter Plot** places each point on the axis's two dimensions; make it with `geom_point()`
![Scatter Plot](images/scatterplot.png)
- **Box Plot** compares categorical value vs a numeric value; make it with `geom_boxplot()`.
![Box Plot](images/boxplot.png)
- The **Density Plot** shows where the the data is concentrated; make with `geom_denstiy()`
![Density Plot](images/densityplot.png)
- Most datasets contain variation and therefore we need to be careful about our conclusions.
- To draw conclusions, we will need to draw conclusions from two hypothesis.
- When the p-value falls below the crucial value - usually .05 - then we reject the null hypothesis.
- We will be using **Student's T-test** for this.
- There are two types:
  1. One-Sample: Mean of a population different from a given value?
  2. Two-Sample: Test if there is a difference in two sample's means.
- We'll use the function `stats.ttest_ind()` for this.
```python
# Create the density plot
print(p9.ggplot(euasdata)+ p9.aes('Sex_ratio', fill="Continent")+ p9.geom_density(alpha=0.5))

# Create two arrays
Europe_Sex_ratio = euasdata[euasdata.Continent == "Europe"].Sex_ratio
Asia_Sex_ratio = euasdata[euasdata.Continent == 'Asia'].Sex_ratio

# Perform the two-sample t-test
t_result= stats.ttest_ind(Europe_Sex_ratio, Asia_Sex_ratio)
print(t_result)

# Test significance
alpha= 0.05
if (t_result[1] < alpha):
    print("Europe and Asia have different mean sex ratios")
else: print("No significant difference found")
```
- The **Chi-Square Test** distinguishes between observed outcomes and a fit distribution.
```python
# Extract sex ratio
sexratio = athletes['Sex'].value_counts()

# Perform Chi-square test
chi= stats.chisquare(sexratio)
print(chi)

# Test significance
alpha= 0.05
if chi[1] < alpha:
    print("Difference between sexes is statistically significant")
else:
    print("No significant difference between sexes found")
```
- The **Fisher Exact Test** tests distinguishes between two different samples.
- To implement this, we first need to create a cross tabulation.
```python
# Create a table of cross-tabulations
table = pd.crosstab(athletes.MedalTF, athletes.Sport)
print(table)

# Perform the Fisher exact test
fisher = stats.fisher_exact(table, alternative='two-sided')
print(fisher)

# Is the result significant?
alpha = 0.05
if fisher[1] < alpha:
    print("Proportions of medal winners differ significantly")
else:
    print("No significant difference in proportions of medal winners found")
```
- The **Pearson's Correlation R** compares two continuous samples for a relationship.
```
# Run the correlation test
pearson = stats.pearsonr(athletes.Weight, athletes.Year)
print(pearson)

# Test if p-value is bigger or smaller than alpha
alpha = 0.05
if pearson[1] < alpha:
    print("Weights and year are significantly correlated")
else:
    print("No significant correlation found")
```


# Design Considerations in Experimental Design
- A **Confounding Variable** is one that was not taken into account in the study.
- It may have an impact on the whether we can trust out analysis.
- If we're making comparison's between samples then we will want ensure that only the variable of interest is different.
- A simple way to manage this would be with random samples.
- In practice, this is called a **Random Block Design**.
```python
# Define random seed
seed = 2397

# Create subsets
subsetathl = athletes[athletes.Sport == "Athletics"].sample(n=30, random_state= seed)
subsetswim = athletes[athletes.Sport == "Swimming"].sample(n=30, random_state= seed)

# Perform the two-sample t-test
t_result = stats.ttest_ind(subsetathl.Weight, subsetswim.Weight)
print(t_result)
```
- You can run a paired T-Test using:
```python
# Perform paired t-test
ttestpair = stats.ttest_rel(podataframe.Yield2018,podataframe.Yield2019)
print(ttestpair)
```
- To deal with multiple values, you'll want to use **Analysis of Variance (ANOVA)**.
- It seeks to partition the variation into separate components.
- We're going to specify this via a formula notation:
```python
# Create model
formula = 'Weight ~ Sex + Team'
model = sm.api.formula.ols(formula, data=athletes).fit()

# Perform ANOVA and print table
aov_table = sm.api.stats.anova_lm(model, typ=2)
print(aov_table)
```
```python
# Create arrays
France_athletes = athletes[athletes.Team == "France"].Weight
US_athletes = athletes[athletes.Team == "United States"].Weight
China_athletes = athletes[athletes.Team == "China"].Weight

# Perform one-way ANOVA
anova = stats.f_oneway(France_athletes, US_athletes, China_athletes)
print(anova)
```
- Another advantage of *Anova* is that it can reveal interactive effects between variables.
- To account for this, we change the formula to add an **Interactive Effect**:
```python
# Run the ANOVA
model = sm.api.formula.ols('Weight ~ Sex + Event + Sex:Event', data = athletes).fit()

# Extract our table
aov_table = sm.api.stats.anova_lm(model, typ=2)

# Print the table
print(aov_table)
```


# Sample size, Power analysis, and Effect size
- When we run a statistical test, we can either fail to reject or reject the null hypothesis.
- There is always a chance that the results came back by chance.
- We can account for multiple tests in a few ways:
  * From the Experimental Design.
  * Correct out P-Values for presence of multiple tests.
- The **Bonferroni Correction** can be used when tests are not independent of each other.
- You will want to use the function:
```python
# Create an array of p-value results
pvals_array = [t_result_1924v2016[1], t_result_1952v2016[1], t_result_1924v1952[1]]
print(pvals_array)

# Perform Bonferroni correction
adjustedvalues = sm.stats.multitest.multipletests(pvals_array, alpha=0.05, method='b')
print(adjustedvalues)
```
- The **Sidak** test can be used when tests are independent from each other.
- A warning that it is less conservative.
```python
# Create array of p-values
pvals_array = [pearson100[1], pearsonHigh[1], pearsonMara[1]]
print(pvals_array)

# Perform Šídák correction
adjustedvalues=  sm.stats.multitest.multipletests(pvals_array, method= 's')
print(adjustedvalues)
```
- A Type II error is a False Negative and we cannot ever remove the risk.
- We can reduce the risk by increasing the sample size though.
- Figuring out what sample size we require means checking other factors.
```pyton
# Create sample with defined random seed and perform t-test
subset = athletes.sample(n=200, random_state= 1007)
print(stats.ttest_ind(subset[subset.Sport == "Athletics"].Weight,
                      subset[subset.Sport == "Swimming"].Weight))
```
- The **Power** is the probability we correctly reject the null hypothesis.
- The **Effect Size** is how much we depart from the null hypothesis.
- To checked for this, we use the function `TTestIndPower()`.
- For the *effect size**, we will use **Cohen's D**.
- It is defined as the difference between the two samples means divided by the pooled standard deviation.
- We will also need to feed it the `ratio` of 1 if the experiment is balanced.
```python
# Set parameters
effect = 0.4
power = 0.8
alpha = 0.05

# Calculate ratio
swimmercount = float(len(athletes[athletes.Sport == "Swimming"].index))
athletecount = float(len(athletes[athletes.Sport == "Athletics"].index))
ratio = swimmercount/athletecount

# Initialize analysis and calculate sample size
analysis = pwr.TTestIndPower()
ssresult = analysis.solve_power(effect_size=effect, power=power, alpha=alpha, nobs1=None, ratio=ratio)
print(ssresult)
```
- Significance is how sure we are that the effect exists.
- The **Effect Size** is how important that effect is.
- We can measure this in a few ways:
  * Cohen's D.
  * Odds Ratio. [ Fisher's Exactness ]
  * Correlation Coefficients.
```python
# Set parameters
alpha = 0.05
power = 0.8
ratio = 1
samp_size = 300

# Initialize analysis & calculate sample size
analysis = pwr.TTestIndPower()
esresult = analysis.solve_power(effect_size=None, power=power, nobs1=samp_size, ratio=ratio, alpha=alpha)
print(esresult)
```
- Calculate Cohen's D by hand:
```python
# Calculate difference between means and pooled standard deviation
diff = swim.mean() - athl.mean()
pooledstdev = ma.sqrt((athl.std()**2 + swim.std()**2)/2 )

# Calculate Cohen's d
cohend = diff / pooledstdev
print(cohend)
```
```python
# Perform the Fisher exact test
chi = stats.fisher_exact(table, alternative='two-sided')

# Print p-value
print("p-value of test: " + str(round(chi[1], 5))  )

# Print odds ratio  
print("Odds ratio between groups: " + str(round(chi[0], 1))  )
```
- **Statistical Power** is the probability of detecting an effect.
- Always remember that statistical tests are always dealing with *likilihood*.


# Testing Normality: Parametric and Non-parametric Tests
- The **Mean** is the sum of the samples divided by the count.
- The **Median** is the the value which half the values fall on each side when sorted.
- The **Mode** is the value that appears the most.
- The **Standard Deviation** is the measure of variability of the data around the mean.
- A **Normal Distribution** has the same mean, median and mode.
- The **Quantile-Quantile (QQ) Plot** is a measure of the distribution of the data.
```python
# Calculate theoretical quantiles
tq = stats.probplot(countrydata.Unemployment, dist="norm")

# Create Dataframe
df = pd.DataFrame(data= {'Theoretical Quantiles': tq[0][0],
                         "Ordered Values": countrydata.Unemployment.sort_values() })

# Create Q-Q plot
print(p9.ggplot(df)+ p9.aes('Theoretical Quantiles', "Ordered Values") +p9.geom_point())
```
- The **Shapiro-Wilk Test** follows the same logic as the *Q-Q Plot*.
- This test is only appropriate for small samples sizes.
- The closer to 1 the result, the more likely to be normally distributed.
- Many tests assume normality that we're using for Statistical Testing.
- When samples sizes are large, the population tends towards normally distributed.
- If the assumption is violated, then we try different tests.
- These are called **Non-Parametric Tests**.
- These make fewer assumptions, no fixed population parameters and when data doesn't fit known distributions.
- A non-parametric version of the T-Test is the **Wilcox Rank-Sum Test**.
- It checks whether random samples of A are greater than random samples from B.
```python
# Perform Wilcoxon rank-sum test
wilc = stats.ranksums(Europe_Sex_ratio, Asia_Sex_ratio)
print(wilc)
```
```python
# Separate the heights by country
NorwayHeights = athletes[athletes['Team'] == "Norway"].Height
ChinaHeights = athletes[athletes['Team'] == "China"].Height

# Shapiro-wilks test on the heights
print(stats.shapiro(NorwayHeights)[1])
print(stats.shapiro(ChinaHeights)[1])

# Perform the Wilcoxon rank-sum test
wilc = stats.ranksums(NorwayHeights, ChinaHeights)
print(wilc)
```
- The **Spearman Test** is the non-parametric version of Correlation.
- This version deals with the ranks of the arrays.


# Research:
 - Bonferroni?
 - Sidak?

# Reference:
