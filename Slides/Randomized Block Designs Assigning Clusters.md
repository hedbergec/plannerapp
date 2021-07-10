# Randomized Block Designs Assigning Clusters Within Blocks

# Larry V. Hedges
Northwestern University
Presented at the NSF Institute on Improving the Design of Evaluation studies in STEM Education Research, July 21, 2021

# Definition of Randomized Block Designs Assigning Clusters

Sometimes the sample comes in blocks\, but it is not possible to assign individuals to treatments

The reasons might be conceptual\, practical\, or political

__Conceptual:__ The intervention is a “whole class” intervention

__Practical:__ It is too hard for different students to receive different treatments in the same classroom

__Political:__ One treatment seems more desirable\, parents  or students will never agree to being randomized within a class \(i\.e\.\, their children not getting the desirable treatment their peers get\)

Sometimes this design is called the “multisite cluster randomized trial” because clusters are assigned to treatments withing sites

# 

# A Statistical Model

# We Have Given the Model for the Blocks-Fixed Analysis

There are two different statistical models for this design: One assumes blocks have fixed effects\, the other assumes that blocks have random effects

The blocks\-fixed analysis is more appropriate for initial field trials

This analysis limits its inferences to the blocks that were observed in the study

# Effect Size

# Testing the Significance of the Treatment Effect

The significance testing process involves

Picking a significance level \(this is up to you\, but 0\.05 is conventional\)

Computing the value of _T_ from the data

Obtaining the critical value of the _t_ \-distribution with _m_ \( _p_ – 2\)degrees of freedom \(which will be about 2 for the for all but the smallest degrees of freedom\)

Reject the null hypothesis of no treatment effect \(in other words conclude that the treatment effect is significant\) if| _T_ |exceeds the critical value

You could also use software that computes the “exact _p_ \-value\.”  In that method\, conclude that the treatment effect is significant if the two\-tailed _p_ \-value is less than 0\.05

# Design Sensitivity

Recall that design sensitivity can be described in any one of three related ways:

Statistical power

Precision \(standard error\) of the estimated treatment effect

The minimum detectable effect size \(MDES\)

We will discuss  design sensitivity mainly through MDES

As a practical matter\, design sensitivity for randomized block designs assigning clusters is limited primarily by the number of clusters \( _p_ \) per block and the feasible number of blocks

We assume in this workshop that the number of blocks \(schools\) available is limited to 5 – 10 \, rarely as many as 20\, so that _m_ = 5 – 10 is about the maximum number of clusters that are feasible

We also assume that the number of clusters \(classrooms\) per school is likely to be at most 5 – 6\, so that the number of clusters per treatment condition is no more than 2 – 3

# MDES in Randomized Block Designs Assigning Clusters

In randomized block designs assigning clusters\, MDES depends  on

1\. The significance level \(0\.05 is a very strong convention\)

2\. The power level desired \(0\.8 is a strong convention\)

The number _m_ of blocks

The number _p_ of clusters per block assigned to each treatment

The number of individuals _n_ within each cluster

The within\-block intraclass correlation _ρ_

The covariate outcome correlation _R_ is covariates are used

MDES depends _strongly_ on the number _m_ of blocks

MDES depends _strongly_ on the number _p_ of clusters assigned to each treatment within blocks

MDES depends _weakly_ on the number _n_ of individuals in each cluster

Moreover\, there is a point of diminishing returns in increasing _n_ \, MDES decreases less rapidly until it reaches an asymptote

MDES tends to some positive value even when _n_ → ∞

Thus\, total sample size _n_ = 2 _mpn_ is a poor guide to design sensitivity

But remember that design sensitivity also depends on _ρ_ \, so understanding MDES in randomized block designs assigning clusters is a complex business

# A Graphical Representation of MDES as  Function of mp = 2

All figures have _ρ_ = 0\.05and _p_ = 2

_n_ = 10\(solid line\)

_n_ = 12\(dashed line\)

_n_ = 15\(dotted line\)

_n_ = 20\(dashed and dotted line\)

All figures have _ρ_ = 0\.05and _p_ = 2

_n_ = 10\(solid line\)

_n_ = 12\(dashed line\)

_n_ = 15\(dotted line\)

_n_ = 20\(dashed and dotted line\)

All figures have _ρ_ = 0\.05and _p_ = 2

_m_ = 4\(solid line\)

_m_ = 7\(dashed line\)

_m_ = 10\(dotted line\)

# MDES in this Design Depends on ρ

As in simple cluster randomized designs\, design sensitivity depends on _ρ_ because of the nature of two stage sampling

Recall the design effect idea\.  This design involves a two\-stage cluster sample\. Within each block\.  The fact that it is a cluster sample imposes a design effect involving _ρ_

One way of talking about this is that _ρ_ \(along with _n_ \) determines the “effective sample size”

The effective sample size in this design is somewhere between the number of clusters2 _mp_ and the total sample size2 _mpn_ \,  determined by the values of _ρ_ and _n_

Effective sample size is

# The Fundamental Problem of Research Design

The fundamental problem of research design is how to plan a _feasible_ design that is adequately sensitive

If you have unlimited number of blocks or clusters\, it is easy to get any design sensitivity you want

But we usually have a severely limited number of both blocks and clusters \( _m_ = 5 – 10\, _p_ =  1\, 2\, or 3\)

In the easiest case\, then you simply use a table like the one presented previously or a software tool and find the _m_ for your _n\, p\,_ and _ρ_ that has an MDES that is smaller than the effect size you expect

Often\, that number _m_ of blocks or _p_ of clusters is larger than the sample you believe you could get

__What then?__

# Three Strategies to Improve Design Sensitivity

Three strategies can be used to improve design sensitivity:

Matching clusters before random assignment \(this strategy should probably _always_ be used in initial field trials\)

Increase cluster size  \(but there are clear limits to class size\)

Use of covariates  \(but this is unlikely to help much if you have matched\)

Unbalanced designs using more control clusters than treatment clusters \( _p_  _C_ > _p_  _T_ \)

# Matching of Clusters Before Random Assignment

The sensitivity of randomized block designs assigning clusters can be increased substantially by matching clusters before random assignment

Matching clusters is easier than in cluster randomized designs because you only have to match within blocks before assignment \(fewer items to match\)

If a covariate is available \(pretest scores of last year’s achievement test scores\) it is possible to “tailor” clusters so that they match very closely on the covariate

Tailoring would involve dropping individuals from clusters \(from the experiment not literally removing them\) so that the covariate scores on the clusters are close to identical

Because the intraclass correlation is measured on the _outcome_ \, this will not make the intraclass correlation zero even if the average covariate scores match exactly

But  matching on the covariate will make the intraclass correlation small:  If the covariate\-outcome correlation is 0\.7\, this can make the intraclass correlation _ρ_  _<_ 0\.05

# Increase Number of Clusters or Cluster Size

If clusters are classes\, the number of clusters pre school is limited\, but increasing the number of clusters greatly increases design sensitivity

Even increasing by one cluster per school can make a noticeable difference \(even if that leads to on odd number of clusters per school and imbalance\)

If clusters are classes\, it may not be possible to increase the cluster size \(more students per class\) very much

However\, if the intraclass correlation is small\, we saw that increasing cluster size \(up to a point\) will increase design sensitivity

# Adding Covariates

__Note:__ If you matched clusters before random assignment\, covariates will be less effective in increasing design sensitivity because _matching reduces the covariate\-outcome correlation at the cluster level_

# The Effect of Covariates on MDES

# Unbalanced Designs

# A Graphical Representation of MDES as  Function of nfor various values of pT and pC

In all figures _m_ = 5\, _ρ_ = 0\.05

_p_  _T_ = 1\, _p_  _C_ = 2\(solid line\)

_p_  _T_ = 1\, _p_  _C_ = 3\(dashed line\)

_p_  _T_ = 2\, _p_  _C_ = 2\(dotted line\)

_p_  _T_ = 1\, _p_  _C_ = 4\(dash dotted line\)

# MDES as a Function of m and n when pT = 1, pC = 2 (ρ = 0.05)

