# Non-Equivalent Control Group Designs

# Elizabeth Tipton

NSF Improving Education R&D Evaluations Workshop
2021

# Quasi-experiments

Some researchers believe that it is easier to implement a quasi\-experimental design than to conduct an experiment\.

We believe that quasi\-experimental designs are indeed easier to implement _poorly_ \, but much _more_ difficult to implement well\.

# You should be worried

* History
  * What if\, in between when the intervention was implemented and the outcome observed\, some \*other intervention\* also occurred\.
  * Example: What if at the same time teachers implemented your new science program\, they also adopted a new math program?
* Maturation
  * What if the participants knowledge would have increased over time\, even without your intervention?
* Selection
  * What if the types of teachers that signed up for your program are different – more motivated\, better teachers\, more experienced – than those that didn’t?

# You will likely need help

A strong design makes for an easy analysis:

In an experiment\, the analyses are often quite straightforward – you are simply comparing average outcomes in the intervention group versus those in the comparison group\.

A weaker design requires a more complex analysis:

In quasi\-experiments\, the analyses are much more complex\, as as tests for model assumptions\.

Doing these analyses well requires expertise – we recommend choosing a consultant or collaborator with these skills\.

# Selection Bias

# Selection processes

* __Example: Smoking as an adult__
  * More likely in low\-SES populationMore likely to have adverse childhood experiences
  * People around them smokeLikely to have started smoking as childrenMore likely to have mental health issuesWeight controlParents smoked
* __Example: Kids play on a sports team__
  * Parents playedHave parents/ adults available to helpMid\- to high\- SESAre healthyParents perceive it will positively affect outcomes
  * Available to them

# Selection  Confounding

_Confounding factors_ influence _both_ the treatment assignment process \(why some individuals are treated and others are not\) _and_ the outcome\.

Confounding is the direct result of _differential selection_ : i\.e\.\, wherein the treatment or intervention is not selected randomly but based on some background characteristics or perception of the effectiveness of the treatment\.

Importantly\, this selection process is _unknown_ to the researcher\.

# Detecting confounding

Think about the selection process:

How did some units end up in treatment and others not?Examine data and identify baseline \(pre\-treatment\) covariatesCalculate _balance_ statistics \(compare means\, SDs\) between T/C on these covariates

Remember: In a randomized experiment\, the _distribution_ of these covariates would be the _same_ in both T & C\. This is your standard of comparison here

Scrutinize: are there other\, _unmeasured_ confounds not included here?

# An intersection

Strong ignorability set of variables

# What bias?

# To be formal

# Comparing them

# Uh oh

# But what about in RCTs?

Wouldn’t this same problem occur there? Couldn’t there be ‘unhappy’ randomizations that lead to some differences between the groups\.

Yes\, there could be some differences\. But what you learned the last few days is:

If the differences are truly random\, they are taken into account in the standard errors and don’t have to be adjusted for\.

But if you do adjust for them\, you can improve precision \(and thus power\)\.

# Selection processes

# What do we do about selection?

Soon\, I will provide an overview of approaches\, including:

Matching

Regression

Weighting

What all of these approaches have in common is that they require a set of confounders to be measured and specified and\, ultimately\, included in a model\.

This is much harder than it sounds\.

# Confounders (again)

Need to measure these variables

# Begin by thinking about selection

Why did you \(as researcher\) approach _these_ schools\, teachers\, or students to be part of the intervention?  Were there certain criteria that they met in order for you to think they would be a good fit?

Why did the schools and/ or teachers taking part in the intervention group decide to join the study? Here\, it is important to think both of the reasons they gave as well as how those that joined the study compare to those that did not\.

Why did the parents and/ or students agreeing to be in the intervention agree to do so? Are they different than those that did not?

# For example

In order to attend this workshop\, you had to apply\.

Then based upon this application\, we selected some \(and not others\) to attend\.

And then you had the choice to attend or to not attend\.

That’s 3 selection processes at play here\, all of which could result in differences between those of you with us and others in the field\.

# Importantly, keep in mind that selection is not always explicit and that a process that seems ‘random’ may still result in confounding.

# Directed acyclic graphs (DAGs) can help

One strategy to identify confounders is to use a DAG \(like an SEM or path model\)\.

In a DAG\, you specify:

Variables \(observed or unobserved\)

Arrows \(directed\) that indicate the direction of dependency

# Interpreting DAGs

<img src="img\Ch 12 Non-Equiv 0.png" width=401px />

_Absence_ of a directed edge is an assertion of no dependency\, and so typically requires justification/backing in theory\.

Once specified\, DAGs can be used to _identify conditional independencies_ among variables\, and thus determine which covariates to use for conditioning\.

# An example

<img src="img\Ch 12 Non-Equiv 1.png" width=362px />

# This helps you identify confounders

# Omitted variables

# Omitted variable bias, always lurking

In the next part\, we’ll go over several methods for adjusting for a set of specified confounders\.

But properties of these estimators – and their ability to recover the causal effect of an intervention – depend upon having the right covariate set\.

An ever\-present threat is that of ‘omitted variablebias’– confounders that exist in the real world\, but that aren’t accounted for in the model\.

# Best practice

Given this concern\, the best practice involves:

Reporting the DAG that led to the adjustment model used

Reporting the covariates \(assumed confounders\) that were adjusted for in your analyses

Being very clear that your goal is to estimate the causal effect\, but that to do so you’ve had to use a model and assumptions

# Worst practice

You may see all of this and feel like you want to throw up your hands and declare\,

“But I’m not trying to estimate a causal effect\. I know this effect is just associational\! Of course\, correlation is not causation\!”

But this isn’t fair\. What does this association even mean\, if not causal? Why would you care about the differences between these groups otherwise?

Own that you care about the causality here\. And own that this is difficult\, that you’ve done the best you can\, and that your results require some assumptions\.

# Matching Models

# Single confounder (theoretical only)

# Coarsened matches

# For example

In our workshop example\, we might look for comparison researchers that:

Have the exact same degrees – e\.g\.\, doctorates \(exact matching\)

Have similar years of experience in the field \(caliper matching\)\, e\.g\.\, where we define similar as “\+/\- 2 years”

# Multiple confounders

With one\, or even two or three confounders\, this isn’t that terrible\.

But remember – those DAGs suggest that there are more\. This makes matching \*very\* tricky\.

One approach is to take this multivariate problem and turn it into a single variable\, then use the same matching approaches as in the single confounder case\.

# Mahalanobis distance

# Vectors? Really?

# General strategy

# Variations

There are \*many\* variations to this approach:

You could match each intervention unit with multiple comparison units \(“k to 1 matching”\)

You could allow the same comparison group unit to be used as a match for multiple intervention group units \(“matching with replacement”\)\.

You could randomize the order in which you match\, then do this multiple times\, looking for the matching combination with the overall smallest distances \(“full matching” or “genetic matching”\)\.

These can result in better matches and improved precision\, but they require more complex analytic models\.

# Pay attention to common support problems

This is a fancy way of saying that the comparison group units available for matching are \*very\* different than those in the intervention group\.

For example\, maybe our workshop includes researchers with a very high interest in research design\, very high comfort with math\, and many years of experience\, but that the available comparison group researchers we have are much less interested\, comfortable\, and experienced\.

We can’t match our way out of this\.

# Evaluating matching success

Remember\, at the end of the process\, the goal is for the intervention and comparison groups to have similar _average covariate values_ \.

We need to verify this\.

# Adequacy of matches

# What if matches aren’t very good?

# Statistical Adjustment Methods

# Regression and ANCOVA

# A simple model

# But there are many other possible models

# What’s going on here?

# It’s not impossible though

# Weighting

# This is complicated, too

# Reporting Guidelines

# ATOM

The American Statistical Association recommends the following to guide reporting:

__A__ ccept uncertainty\, be __T__ houghtful\, __O__ pen\, and __M__ odest\.

__Accepting__ uncertainty means planning studies that are sensitive \(e\.g\.\, a large enough sample to detect a reasonable MDES\)\.

Being __thoughtful__ means carefully evaluating your results: How precise is the estimate? Is the model correctly specified? Are the assumptions reasonable and understood? Do the results hold if I change my model?

# Example balance table

