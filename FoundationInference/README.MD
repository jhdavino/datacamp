# Foundations of Inference
## Jo Hardin

# Introduction
- **Statistical Inference**: The process of making claims about a population based on information from a sample.
- **Null Hypothesis**: The claim that is not interesting.
- *Alternative Hypothesis**: The claim that we're trying to prove.
- Goal is to reject the Null Hypothesis using sample data.

- We pick .05 for the sake of history:
```
"It is a common practice to judge a result significant, if it is of such a magnitude that it would have been produced by chance not more frequently than once in twenty trials...

The test of significance only tells him what to ignore, namely all experiments in which significant results are not obtained. He should only claim that a phenomenon is experimentally demonstrable when he knows how to design an experiment." -R.A. Fisher (1929)
```

- What is a p-value?
- .. is the probability of observing data as or more extreme than what we actually got given that the null hypothesis is true.

- Errors in Hypothesis Testing:
	1. Inconsistent with the Null Hypothesis: Type I Error.
	2. Consistent with the Null Hypothesis  : Type II Error.

## Investigate:
- A *Parameter* is a numerical value from the population.
- Another name is called Feature,
- A *Confidence Interval* is where we are reasonably certain the studied effect will appear.

- *Bootstrapping* is where you repeatedly resample from your sample taken.
- Labeled p-hat-star.
- Bootstrapping can help approximate Standard Error.

- "Emperical Rule" ~ Chebyshev's Theorum.
- Emperical is for Bell shaped curves; Chebyshev is for all numerical distrubutions.


# Research:
- NHANES Package?
- oilabs Package?

# Reading:
