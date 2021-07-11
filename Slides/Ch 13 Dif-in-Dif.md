# Difference-in-Difference

# Elizabeth Tipton

NSF Improving Education R&D Evaluations Workshop
2021

# Pre-Post Problems

# A deeper problem

This can be confusing: I see that participants have large gain scores\, so what do you mean that isn’t “caused” by the intervention?

Remember that the causal effect\, however\, is about potential outcomes\. It is not about the effect you observe\, but about __what would have happened in the absence of this intervention__ \.

The causal effect is inherently about comparing two versions of reality\.

# Example

# Statistical Model

# Model

<img src="img\Ch 13 Dif-in-Dif0.png" width=500px />

# How does this work?

__Main idea__ : Without the intervention\, the two groups would have the same slope over the full range of time

We are assuming:

in both groups

the relationship between __time \(X\)__ and __the outcome \(Y\)__

is __linear__

and these lines are __parallel__

This allows us to __extrapolate__ what would have happened in the treatment group if there was no intervention\.

<img src="img\Ch 13 Dif-in-Dif1.png" width=500px />

# Parallel Trends Assumption

In words\, we are assuming that __in the absence of the intervention\,__

The two groups are changing at the same rate over time

The slopes of their growth trajectories over time are the same

We are using the growth trajectory in the comparison group to provide ‘counter\-factual’ information on that the growth trajectory would have been in the intervention group\, if there were no intervention\.

# Common Shocks Assumption

In this design\, the comparison condition is not explicitly required to be identical to the intervention condition\.

However\, the comparison group can only control for other intervening causes if _it experiences the same intervening causes_ experienced by the intervention group\.

This means we assume that the intervention and comparison groups _experience the same ”shocks” \(other causes\, other interventions\) between pretest and posttest_

# Statistical Analysis

# Gain Scores

# Regression

# Estimation

# Diff-in-Diff regression coefficient

# Verification of Assumptions

Neither of these two assumptions is easy to verify\.

# Parallel trends verification

Determining the growth trajectories of each group would require assessments of the outcome variable at many \(or at least several\) points in time\.

It may be impossible or infeasible to administer more than two such tests \(the pretest and the posttest\)\.

Strategies:

If possible\, then include additional measures for a \(randomly selected\) subset of students\.

Use extant data on growth trajectories \(e\.g\.\, in ECLS\)

Clearly state the assumptions and any evidence you have\, or don’t have

# Common Shocks Verification

While it is difficult to know that _all possible_ variables that could constitute shocks have been measured\, it is possible to measure \*some\* of these\.

Strategies:

Measure a variety of variables that might constitute shocks in both groups and

Determine whether the mean values of those variables are similar in the two groups \(the logic is similar to matching\)\.

# Design Sensitivity

# Design parameters

Statistical power for this design is a function of:

Intervention group sample size

Comparison group sample size

Effect size

Correlation between pre\- and post\-test

# 

\(something here exploring sensitivity\)

# Strategies to Increase Design Sensitivity

# Unequal group sizes

Just as with randomized studies\, there may be reasons why it is easier to collect data in the intervention group or comparison group\.

For example:

The intervention may need to be small\, but there is administrative data that can be used for the comparison group \(which is much larger\)

Schools are only willing to participate if most classes get the intervention – thus a smaller fraction is available for the comparison

# 

Something here exploring sensitivity with unequal sizes

# Using covariates

When using the regression approach\, covariates can be included\. These offer two benefits:

They improve the internal validity of the design\, as they lead to groups that are more similar \(on observed covariates\)\, thus ruling out other possible explanations \(e\.g\.\, selection\)

They improve statistical conclusion validity\, by improving sensitivity\. Including covariates reduces the residual variation\, thus improving power\.

# 

\(something here showing how covariates help\)

# Planning a DiD Study

# What do you need?

At a minimum\, you will need an:

Intervention group

Comparison group

Pre\- and post\- test measure

Ideally\, you will also have:

Measures of other potential causes \(“shocks”\) experienced in the two groups

Measures at additional time\-points \(for at least a random subset\)

Covariates correlated with the outcomes

# Selecting a comparison group

Your ideal comparison group is somewhat like your intervention group\. For example:

A different grade in the same school

Another\, similar school in the same district

They don’t have to be identical\, but you should have reason to expect that their growth trajectories would be parallel and that they would experience similar ‘shocks’\.

# Be careful about regression effects

