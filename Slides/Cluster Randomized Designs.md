# Cluster Randomized Trials

# Larry V. Hedges
Northwestern University
Presented at the NSF Institute on Improving the Design of Evaluation studies in STEM Education Research, July 21, 2021

# Definition of Cluster Randomized Designs

A cluster randomized design \(also called hierarchical design\) is that individuals are nested within clusters and entire clusters are randomly assigned to treatment or control conditions

Intervention

Cluster 1

Intervention

Cluster 2

Intervention

Cluster _m_

Control

Cluster 1

Control

Cluster 2

Control

Cluster _m_

An equal number _n_ of individuals from each cluster is typically ideal\, but this is not necessary \(planning designs almost always assumes equal _n_ per cluster for simplicity\)

An equal number of clusters _m_ is typically used in treatment and control groups\, but this isn’t necessary either

The key to the design is that clusters are assigned to treatment groups using a random process

# Why Would You Use A Cluster Randomized Design?

Cluster randomized designs make sense when it is practically\, politically\, or conceptually difficult to assign treatments to individuals

For example:

It may be difficult to assign different curricula to students in the same classroom or school

If one treatment is perceived to be more desirable\, it may be difficult to persuade parents or students to allow random assignment that could lead to receiving the less desirable treatment

The treatment is defined in terms of whole clusters\, it may not be conceptually possible to assign individually \(e\.g\.\, whole school positive behavior support\, whole school  or class participation or trust initiatives\, etc\.\)

Cluster randomized designs are also used if there is a high possibility of treatment diffusion within clusters \(treatment contamination in the control group\)\, which would compromise the treatment\-control  contrast

# A Statistical Model

# The Stochastic Specification

As with other designs\, of the four parts of the stochastic specification\, __only the first part__  __is important__

Independence of the observations is crucial but it is empirically unverifiable

We usually think that different individuals\, sampled at random from a cluster are independent

We usually think that different clusters\, sampled at random from a population are independent

If we can think of the clusters and individuals in our study that way\, we may be able to think of them as independent

# Effect Size

It is conventional to define the treatment effect size parameter \(note the Greek letter _δ_ \)in terms of the structural model as the standardized mean difference as

This corresponds the treatment group mean minus the control group mean divided by the within\-group standard deviation  \(sometimes called Cohen’s __d__ \)

The treatment effect size is important because:

It is a metric that is widely used to compare treatment effects across different experiments

It is a key factor that determines the _sensitivity_ of research designs

For technical reasons\, the mathematically natural effect size in the cluster randomized design does not look the same as that for individually randomized designs\, namely\( _α_  _1_  _–_  _α_  _2_ \)/ _𝜎_  _ε_

It is closely related however because the stochastic specification of the model says that  the total variance of the outcome is _𝜎_  _T_  _2_  _= 𝜎_  _ε_  _2_  _\+_  _τ_  _2_

Therefore

where _ρ_ is the intraclass correlation defined by _ρ_ = _𝜎_  _ε_  _2_ /\( _𝜎_  _2_ \+ _τ_  _2_ \)

As it turns out _ρ_ will be small \(e\.g\.\, _ρ_ < 0\.1\) in feasible cluster randomized designs for initial field trials so that the “natural” effect size for cluster randomized trials is within 5% of that for individually randomized trials\, nearly the same

__But\,__ design sensitivity for cluster randomized designs is lower than that of individually randomized designs for other reasons

# Testing the Significance of the Treatment Effect

The significance testing process involves

Picking a significance level \(this is up to you\, but 0\.05 is conventional\)

Computing the value of _T_ from the data

Obtaining the critical value of the _t_ \-distribution with2 _m_ – 2degrees of freedom \(which will be about 2 for the for all but the smallest degrees of freedom\)

Reject the null hypothesis of no treatment effect \(in other words conclude that the treatment effect is significant\) if| _T_ |exceeds the critical value

You could also use software that computes the “exact _p_ \-value\.”  In that method\, conclude that the treatment effect is significant if the two\-tailed _p_ \-value is less than 0\.05

# Déjà vu?

You might be thinking you have seen this test statistic  and testing procedure before somewhere

You have: This looks a lot like the test statistic for the individually randomized design

It turns out that when the design is balanced \(all clusters have the same size _n_ \) the optimal significance test in the cluster randomized design is just the same as treating the cluster means \(the _Y_  _1j●_ ‘s and _Y_  _2j●_ ‘s as  if they were “individual observations\,”  so there are2 _m_ “observations”

If the design is almost balanced just analyzing the cluster means would be very close to optimal

Many people seem to feel that it is much better to analyze all the data \(not just the cluster means\)\, but this is wrong because of the statistical principle of _sufficiency_ :  Sometimes summary statistics \(like cluster means\) contain all the information in the observations and any sensible analysis depends on the data only through those summary statistics

# Design Sensitivity

Recall that design sensitivity can be described in any one of three related ways:

Statistical power

Precision \(standard error\) of the estimated treatment effect

The minimum detectable effect size \(MDES\)

We will discuss  design sensitivity mainly through MDES

As a practical matter\, design sensitivity for cluster randomized designs is limited primarily by the number of clusters \( _m_ \)\, and that clusters  will often be  schools \(but sometimes classrooms\)

We assume in this workshop that the number of schools available is limited to 5 – 10 \, rarely as many as 20\, so that _m_ = 5 – 10 is about the maximum number of clusters that are feasible

If clusters are classrooms\, a slightly larger number might be feasible

# MDES in Cluster Randomized Designs

In cluster randomized designs\, MDES depends  on

1\. The significance level \(0\.05 is a very strong convention\)

2\. The power level desired \(0\.8 is a strong convention\)

The number _m_ of clusters randomized to each treatment

The number of individuals _n_ within each cluster

The intraclass correlation _ρ_ \(this is a new and complicating factor in cluster randomized designs\)

The covariate outcome correlation _R_ is covariates are used

MDES in cluster randomized designs depends _strongly_ on the number _m_ of clusters

MDES in cluster randomized designs depends w _eakly_ on the number _n_ of individuals in each cluster

Moreover\, there is a point of diminishing returns in increasing _n_ \, MDES decreases less rapidly until it reaches an asymptote

MDES tends to some positive value even when _n_ → ∞

Thus\, total sample size _n_ = 2 _mn_ is a poor guide to design sensitivity

But remember that design sensitivity also depends on _ρ_ \, so understanding MDES in cluster randomized designs is a complex business

# A Graphical Representation of MDES as  Function of n

All figures have _ρ_ = 0\.05

_m_ = 4\(solid line\)

_m_ = 7\(dashed line\)

_m_ = 10\(dotted line\)

# MDES as a Function of m and n for ρ = 0.05

# MDES in Cluster Randomized Designs Depends on ρ

The dependence of design sensitivity on _ρ_ may seem puzzling\, but it comes from the nature of two stage sampling

Recall the design effect idea\.  The cluster randomized design involves a two\-stage cluster sample\.  The fact that it is a cluster sample imposes a design effect involving _ρ_

One way of talking about this is that _ρ_ \(along with _n_ \) determines the “effective sample size”

The effective sample size is somewhere between the number of clusters2 _m_ and the total sample size2 _mn_ \,  determined by the values of _ρ_ and _n_

Effective sample size is

# Asymptotic MDES (as n→∞) as a Function of m and ρ

# A Graphical Representation of MDES as a Function of ρ

All figures have _n_ = 10

_m_ = 4\(solid line\)

_m_ = 7\(dashed line\)

_m_ = 10\(dotted line\)

# The Fundamental Problem of Research Design

The fundamental problem of research design is how to plan a _feasible_ design that is adequately sensitive

If you have unlimited number of clusters\, it is easy to get any design sensitivity you want

But we usually have a severely limited number of clusters \( _m_ = 5 – 10\)

In the easiest case\, then you simply use a table like the one presented previously or a software tool and find the _m_ for your _n_ and _ρ_ that has an MDES that is smaller than the effect size you expect

Often\, that number _m_ of clusters is larger than the sample you believe you could get

__What then?__

# Three Strategies to Improve Design Sensitivity

Three strategies can be used to improve design sensitivity:

Matching clusters before random assignment \(this strategy should probably always be used in initial field trials\)

Increase cluster size

Use of covariates

Unbalanced designs using control clusters than treatment clusters

# Matching of Clusters Before Random Assignment

The sensitivity of cluster randomized designs can be increased substantially by matching clusters before random assignment

If a covariate is available \(pretest scores of last year’s achievement test scores\) it is possible to “tailor” clusters so that they match very closely on the covariate

Tailoring would involve dropping individuals from clusters \(from the experiment not literally removing them\) so that the covariate scores on the clusters are close to identical

Because the intraclass correlation is measured on the _outcome_ \, this will not make the intraclass correlation zero even if the average covariate scores match exactly

But  matching on the covariate will make the intraclass correlation small:  If the covariate\-outcome correlation is 0\.7\, this can make the intraclass correlation _ρ_  _<_ 0\.05

# Increase Cluster Size

If clusters are schools\, it may be possible to increase the cluster size \(more students per school\) than to increase the number of clusters

Particularly if the intraclass correlation is small\, we saw that increasing cluster size \(up to a point\) will increase design sensitivity

# Adding Covariates

A covariate is any variable whose value cannot be influenced by treatment assignment

_Useful_ covariates are those that are correlated with the outcome

A pretest covering similar content is often a good covariate

The covariate does not need to measure the same things to be useful: All that matters is that it is correlated with the outcome

You do not need to have a theory of _why_ the covariate is correlated with the outcome

Reading scores can be useful covariates  for math and science outcomes and vice versa

Demographic variables \(gender\, ethnicity\, SES\) tend to be less useful as covariates than test scores

__Note:__ If you matched clusters before random assignment\, covariates will be less effective in increasing design sensitivity because _matching reduces the covariate\-outcome correlation at the cluster level_

# The Effect of Covariates on MDES

# Unbalanced Designs

Eric: This would be a good place for an insert of how increasingmC\(fixingmT\) deceases MDES

Note that the effect on MDES \(design sensitivity\) of increasing sample size of the control group are generally modest \(except for the smallest treatment group sample sizes

Note that there is a point of diminishing returns\, beyond which further increases have only negligible effects

# The Effect on MDES of Larger Control Groups

# You Can Use Both Covariates and Imbalance(and maybe larger cluster sizes)

