# Individually Randomized Designs

# Larry V. Hedges
Northwestern University
Presented at the NSF Institute on Improving the Design of Evaluation studies in STEM Education Research, July 20, 2021

# Varieties of Randomized Experiments

There are a huge variety of experimental designs that involve randomization

Designs can differ in terms of:

1\. What is randomized \(individuals\, groups\, etc\.\)

2\. How the data is organized before randomization \(subdivided in some ways\, counterbalanced\, etc\.\)

3\. How the data is sampled

4\. How or if matching is used

5\. How or if statistical controls are used

# Definition of Individually Randomized Designs

In an individually randomized design\, some sample of individuals \(not groups\) is randomly assigned to treatment or a control condition

Equal numbers are often assigned to each group

Assignment of unequal numbers to each group is also possible

But the key principle is that assignment is at __random__

__Haphazard or unknown assignment is not random assignment__

# Examples

We have 100 students in a school\, we assign 50 at random to get the treatment \(and after school enrichment program\) and  the other 50 serve as “no treatment” controls

We have 50 teachers in a school district\, we assign 20 at random to get the treatment \(a professional development program\) and the other 80 serve as “no treatment” controls

There are 30 students in a \(large\) classroom\.  We randomly assign 15 students to work with one biology curriculum and 15 students to work with a different biology curriculum

There are 25 students in a classroom\.  We randomly assign 2 students to take a “pull out” supplementary math program\.  The other 23 students serve as controls\.

We have 100 students in a school\, we assign 50 at random to get the treatment \(and after school enrichment program\) and  the other 50 serve as “no treatment” controls

We have 50 teachers in a school district\, we assign 20 at random to get the treatment \(a professional development program\) and the other 80 serve as “no treatment” controls

There are 30 students in a \(large\) classroom\.  We randomly assign 15 students to work with one biology curriculum and 15 students to work with a different curriculum

There are 25 students in a classroom\.  We randomly assign 2 students to take a “pull out” supplementary math program\.  The other 23 students serve as controls

We have been working with 5 students in a cognitive lab\.  We assign 3 students to get a modification of the technology we have been using and the other 2 students work with the old version of the technology

# Are These Examples of Random Assignment?

We have a list of 100 students in a school\. We assign 50 students with odd numbers \(1st\, 3rd\, 5th\, etc\.\) to get the treatment \(and after school enrichment program\) and  the other 50 \(with even numbers\) serve as “no treatment” controls

We have a list of 100 students in a school\.  For each student\, we flip a coin and assign the student to the treatment group is a heads comes up\.  We stop when we have assigned 50 to the treatment

We have 50 students in a school and two curricula \(earth science and biology\)\. We assign 25 students to receive earth science first semester \(biology the second\) by flipping a coin as above\.  The other students get biology in the first semester \(earth science the second\)\.  The outcome is an end of  first semester test

In the last example\, what if we evaluated the outcome after the second semester\.

# The Treatment Contrast

Treatment effects are contrasts between two things

The very idea of “treatment effect” is meaningless without have in mind some other \(counterfactual\) condition

Recall that the definition of causal effect of a treatment on an outcome is the difference between the outcome that would be observed if the individual got the treatment and the outcome if they receive some other \(comparison\) condition

This is called a counterfactual definition of causal effect because individuals cannot receive both the treatment condition and the comparison condition

What is the treatment contrast in each of these:

We have 100 students in a school\, we assign 50 at random to get the treatment \(and after school enrichment program\) and  the other 50 serve as “no treatment” controls

There are 30 students in a \(large\) classroom\.  We randomly assign 15 students to work with one biology curriculum and 15 students to work with a different curriculum

There are 25 students in a classroom\.  We randomly assign 2 students to take a “pull out” supplementary math program\.  The other 23 students serve as controls

We have been working with 5 students in a cognitive lab\.  We assign 3 students to get a modification of the technology we have been using and the other 2 students work with the old version of the technology

What is the treatment contrast in these examples:

We have 50 students in a school and two curricula \(earth science and biology\)\.  We assign 25 students to receive earth science first semester \(biology the second\) by flipping a coin as above\.  The other students get biology in the first semester \(earth science the second\)\.  The outcome is an end of  first semester test

In the last example\, what if we evaluated the outcome after the second semester\.

# A Statistical Model

# The Stochastic Specification

# Why Are the Other Two Assumptions Less Important

Consider this analysis of our experiment

Compute the difference between the mean of the treatment and control groups \(the treatment effect\) in our experiment

Take the _Y_  _ik_ ’sand make a list of every possible way that we could have assigned _i_ =1to _n_ of them and _i_ =2to the other _n_ outcomes \(it would be long list\)

Compute the difference between the mean of the treatment and control groups \(the treatment effect\) in every one of the possible assignments on our long list

Compare the treatment effect we observed to the list \(the distribution\) of treatment effects that might have been observed with  all the different possible treatment assignments to the observed outcomes

Believe the treatment effect is real if the observed treatment effect is unusual among all possible treatment effects \(with different assignments\)

The process I just described is called a randomization test\.  It makes no assumptions except independence

R\. A\. Fisher\, the father of randomized experiments\, proposed the randomization test as a way  to analyze experimental data \(The Lady Tasting Tea allegory\)

What is surprising and __completely__ non\-obvious is that the statistical methods we will talk about are known \(via the theory of mathematical statistics\) to be very good approximations to randomization tests

That means that the other two pats of the stochastic model are not terribly important

# Effect Size

# Testing the Significance of the Treatment Effect

The significance testing process involves

Picking a significance level \(this is up to you\, but 0\.05 is a very strong convention\)

Computing the value of _T_ from the data

Obtaining the critical value of the _t_ \-distribution with2 _n_ – 2degrees of freedom \(which will be about 2 for the for all but the smallest degrees of freedom\)

Reject the null hypothesis of no treatment effect \(in other words conclude that the treatment effect is significant\) if| _T_ |exceeds the critical value

You could also use software that computes the “exact _p_ \-value\.”  In that method\, conclude that the treatment effect is significant if the two\-tailed _p_ \-value is less than 0\.05

# Design Sensitivity

Recall that design sensitivity can be described in any one of three related ways:

Statistical power: The probability of detecting a given treatment effect size

Precision \(standard error\) of the estimated treatment effect: The uncertainty \(margin of error\) of the estimated treatment effect

The minimum detectable effect size \(MDES\): The smallest effect size that can be detected with a given statistical power

Design sensitivity depends on the research design

We plan a design to have adequate sensitivity so that the results of the study will be conclusive

Why is design sensitivity important?

Consider a study that has low power \(say 0\.4\) to detect the treatment effect size you expect

_If_ you detect the effect \(find that the treatment effect is statistically significant\)\, the study is conclusive

_But if you do not find a significant effect_ \,

it could be because the treatment has no effect _or_

because the treatment produced the expected effect but was not detected

Moreover\, if the power is 0\.4\, it mans that  there is a 60% chance you will fail to find the effect if it is there—nonsignificant effects are more likely than significant effects

# Statistical Power

# Precision

# Minimum Detectable Effect Size (MDES)

# Statistical Power as a Function of n and Effect Size δ

# Minimum Detectable Effect Size as a Function of n

# A Graphical Representation of MDES as a Function of n

# MDES is Easy to Use in Planning Designs

# The Fundamental Problem of Research Design

The fundamental problem of research design is how to plan a _feasible_ design that is adequately sensitive

If you have unlimited sample size\, it is easy to get any design sensitivity you want

But we never have access to an unlimited sample size

Especially in development studies\, we are usually limited to a small number of schools or classes \(10 or less\) and at most a few hundred students

# How Do You Plan a Research Design?

Start with some notion of the effect size you expect

Then consider what sample of individuals you believe you could get to test the treatment

Are they grouped into schools or classrooms?  Can they plausibly be considered independent?

Can they be assigned to treatments individually?

__If not\, then the individually randomized design cannot be used__

In the easiest case\, then you simply use a table like the one presented previously or a software tool and find the sample size that has an MDES that is smaller than the effect size you expect

Often\, that sample size is larger than the sample you believe you could get

__What then?__

If the balanced design requires a bigger sample size than you believe you can get then:

You can get a bigger sample \(it may just be a matter of trying harder\)

Change the design \(how you do this will depend on what is feasible\)

Options for changing the design:

Use a covariate

Consider an unbalanced design

Consider a randomized block design \(possibly with covariates\)

# Adding Covariates

A covariate is any variable whose value cannot be influenced by treatment assignment

_Useful_ covariates are those that are correlated with the outcome

A pretest covering similar content is often a good covariate

The covariate does not need to measure the same things to be useful: All that matters is that it is correlated with the outcome

You do not need to have a theory of _why_ the covariate is correlated with the outcome

Reading scores can be useful covariates  for math and science outcomes and vice versa

Demographic variables \(gender\, ethnicity\, SES\) tend to be less useful as covariates than test scores

# The Effect of Covariates on MDES

# A Tabular Representation of the Influence of R on MDES

# Unbalanced Designs

Eric: This would be a good place for an insert of how increasingnC\(fixingnT\) deceases MDES

Note that the effect on MDES \(design sensitivity\) of increasing sample size of the control group are generally modest \(except for the smallest treatment group sample sizes

Note that there is a point of diminishing returns\, beyond which further increases have only negligible effects

# A Tabular Representation of the Influence of Unbalanced Designs on MDES

# You Can Use Both Covariates and Imbalance

