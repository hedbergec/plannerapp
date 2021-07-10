# Review of Statistics

# Elizabeth Tipton

NSF Improving Education R&D Evaluations Workshop
2021

# A warm-up

Throughout the week\, the text\, lectures\, and labs will use statistical notation\.

It’s important that we begin with shared language and notation\.

In this session\, I’m going to give a ‘warm\-up’\, a high \-level review of statistics\.

Please ask questions\.

# Populations and Samples

# Overview

A _population_ is the conceivable \(and possibly infinite\) set of _possible_ observations\.

A _sample_ is a subset of a population that can be observed\.

Samples can be small or large and can be selected from the population in any possible way\.

# Notation

Characteristics of __populations__ are called _parameters\._

Characteristics of __samples__ are called _statistics_ \.

We typically use Greek letters for parameters and Roman letters for statistics\.

# Random Sampling

# Descriptive statistics

* In a sample\, we can summarize the data using statistics\.
  * ”The sample mean is 4\.2\.”
  * “ The variance in our sample is 1\.3\.”
* These can be calculated \(i\.e\.\, there is a formula\) using data that we have collected\. We definitively \*know\* these values\.

# Sample -> Population link

We can also use the statistics in our sample to __estimate__ associated population parameters\.

Remember: we can never definitively know these parameter values\.

To get from a sample to a population\, we need __random sampling__ \.

# Random sampling

In random sampling\, every unit \(e\.g\.\, student\, school\) in the population has a non\-zero probability of being in the sample\.

This provides the bridge we need to make inferences\.

Thinking this way shifts our perspective\. Now the sample we observe is not the only sample\, but one of an infinite number of possible samples we could have observed\.

So\, while the mean in our sample is 4\.2\, in another sample from the same population\, the mean could have been 5\.1 \(or 3\.9 or 4\.1 or 1\.2 …\)\.

# The bridge

\* We = statisticians

# Is this right?

“But our samples aren’t random?” “And didn’t we say that we weren’t going to generalize to populations?”

This is where it gets a bit dicey\. Even though the sample you see is not a random sample from a larger target population\, it \*can\* be conceived of as a random sample from \*some\* population\.

# Models and Notation

# Notation we will use

# Now with an intervention

# Estimators and Sampling Distributions

# Estimating parameters

# Sampling distributions

\* We = statisticians

# In practice

If we know the sampling distribution and our sample statistics\, we can now use these distributions to infer _how close our estimate is likely to be to the true parameter value\._

For example\, we can use this sampling distribution to create:

A confidence interval

A hypothesis test

# Statistical Inference

# Decision making with data

# Scientific vs Statistical Hypotheses

# Null hypothesis testing

# But this is a stochastic proof

# Statistical power

# Effect Sizes

# Common scales

# Effect sizes use a common scale

# Measurement and effect size

The reliability of the measurement of the outcome variable has an important relation with the effect size\.

It does \*not\* affect the numerator \(the difference\)

It \*does\* affect the denominator \(the standard deviation\)

In general\, the lower the reliability\, the smaller the effect size\. \(Thus improving the reliability of a test can increase the effect size\)\.

# Alignment of measures and effect size

The alignment of the measure and intervention can have a large effect on the numerator \(the mean difference\)\.

A measure that is proximal \(highly aligned\) with the intervention will lead to a larger effect size\.

A measure that is distal \(e\.g\.\, standardized\) with the intervention will lead to a smaller effect size\.

# Design Sensitivity

# 3 ways to talk about sensitivity

Statistical power

Minimal detectable effect size

Precision

# Design Complexities and Models

# 

# Factors, Covariates, and Blocks

# 3 confusing concepts

* __Factor:__ A variable that is manipulated by randomly assigning their values\.
* __Covariate__ : Any variable that cannot be affected by the treatment \(intervention or comparison\) but that are correlated with the outcome\.
* __Block__ : A categorical covariate\.
  * Naturally occurring: Schools\, districts\.
  * Discretized characteristics: SES\, urbanicity\, etc\.

# Cluster Sampling

# Simple random sampling

# Two-stage sampling

# Two-stage decisions

# Clustering

# Intraclass correlation

# Design effect

# Clusters affect design

In most evaluations\, nesting / clustering is just a fact of life\.  But it’s an important fact that has large implications for design\.

There is a fundamental tension:

More clusters \(schools\) means greater precision and statistical power\.

Fewer clusters \(schools\) is easier to implement and far less costly\.

The general question is: __What is the smallest number of clusters \(schools\) I can possibly include so that I have adequate power?__

