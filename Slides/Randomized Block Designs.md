# Randomized Block Designs

# Larry V. Hedges
Northwestern University
Presented at the NSF Institute on Improving the Design of Evaluation studies in STEM Education Research, July 20, 2021

# What is a Randomized Block Design?

In the most abstract sense\, a randomized block design is one that assigns individuals to treatments not overall but _within pre\-existing groups_ \(called blocks in the experimental design literature\)

Randomized block designs are also called multisite designs because the blocks are often geographical or organizational sites \(like classrooms or schools\)

The individuals within blocks are implicitly matched on everything blocks have in common

Often these designs arise because of multi\-stage sampling: Individuals are nested within sites or statistical clusters \(hence the name multisite design\)

For example: You need to go to several schools in order to obtain the required sample size\, so you randomly assign individuals to treatments _within schools_

In a balanced design\, the same number _n_ of individuals will be assigned to each treatment within each site or block\, for a total of2 _n_ individuals per site or block\, with _m_ sites or blocks\, and  a total sample size of _N_ = 2 _mn_

# How is this Design Different from the Individually Randomized Design?

Suppose the sample comes from five schools

In the individually randomized design\, you would make a list of all participants and randomize participants into treatments regardless of which school they were in—you might wind up with different numbers of treatment or control participants in different schools

In a randomized block design\, you would make up a list of participants in each school and carry out a separate randomization within each schools separately

This doesn’t sound like much of a difference\, but it can make a huge difference in design sensitivity

Why?

Because participants are matched within blocks\, differences between blocks do not contribute toe experimental error \(noise\)

# Examples Slides

# 

# A Statistical Model

# Effect Size

# Testing the Significance of the Treatment Effect

The significance testing process involves

Picking a significance level \(this is up to you\, but 0\.05 is conventional\)

Computing the value of _T_ from the data

Obtaining the critical value of the _t_ \-distribution with2 _m_ \( _n_ – 1\)degrees of freedom \(which will be about 2 for the for all but the smallest degrees of freedom\)

Reject the null hypothesis of no treatment effect \(in other words conclude that the treatment effect is significant\) if| _T_ |exceeds the critical value

You could also use software that computes the “exact _p_ \-value\.”  In that method\, conclude that the treatment effect is significant if the two\-tailed _p_ \-value is less than 0\.05

# Design Sensitivity

Recall that design sensitivity can be described in any one of three related ways:

Statistical power: The probability of detecting a given treatment effect size

Precision \(standard error\) of the estimated treatment effect: The uncertainty \(margin of error\) of the estimated treatment effect

The minimum detectable effect size \(MDES\): The smallest effect size that can be detected with a given statistical power

We will primarily use MDES as a tool to plan a design to have adequate sensitivity so that the results of the study will be conclusive

# Inference Status of Blocks

The  randomized block design introduces a new issue: How do we conceive the sampling of blocks?

This seems like an arcane technical issue\, but it boils down to this:

1\. Do we want to know what the mean treatment effect is in these \(the observed\) blocks  or

2\. Do we wish to know what the mean treatment effect is in a larger population of blocks from which these \(the observed\) blocks are a random sample?

The second is a much harder  inference to make\, but it is appropriate in efficacy or effectiveness trials

Most initial field trials\, the first \(inference about the treatment effect in the observed blocks\) is both easier and more appropriate __We will assume that this is the objective of your evaluations__

Remember: Your goal is probably to show that the treatment can work in some realistic settings\, not all settings

# MDES in Randomized Block Designs

In randomized block designs\, MDES depends  on

1\. The significance level \(0\.05 is a very strong convention\)

2\. The power level desired \(0\.8 is a strong convention\)

The number _m_ of blocks

The number of individuals randomized within blocks

The covariate outcome correlation _R_ is covariates are used

__But__ to a very good approximation\, the MDES depends only the total sample size _N =_ 2 _mn_ \, not _m_ and _n_ individually

# Design Sensitivity as a Function of m and n for Fixed N

# 

Eric: This might be a good place for a statistical power or MDES insert

# A Graphical Representation of MDES as a Function of N

# The Fundamental Problem of Research Design

The fundamental problem of research design is how to plan a _feasible_ design that is adequately sensitive

If you have unlimited sample size\, it is easy to get any design sensitivity you want

But we never have access to an unlimited sample size

Especially in development studies\, we are usually limited to a small number of schools or classes \(10 or less\) and at most a total _N_ of few hundred students

# How Do You Plan a Research Design?

Start with some notion of the effect size you expect

Then consider what sample of individuals you believe you could get to test the treatment

Are they grouped into schools or classrooms?  Can they plausibly be considered independent?

Can they be assigned to treatments individually within schools?

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

# The Effect of Covariates on MDES

# A Tabular Representation of the Influence of R on MDES

# Unbalanced Designs

Eric: This would be a good place for an insert of how increasingnC\(fixingnT\) deceases MDES

Note that the effect on MDES \(design sensitivity\) of increasing sample size of the control group are generally modest \(except for the smallest treatment group sample sizes

Note that there is a point of diminishing returns\, beyond which further increases have only negligible effects

# A Tabular Representation of the Influence of Unbalanced Designs on MDES

# 

Eric: This could be a good place for a demo of both unbalance and covariates on MDES

