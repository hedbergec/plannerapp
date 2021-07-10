# Intro to Randomized Designs

# Elizabeth Tipton

NSF Improving Education R&D Evaluations Workshop
2021

# Random assignment “does not mean that the experimenter writes down the names of the varieties [treatments] in any order that occurs to him, but that he carries out a physical experimental process of randomization, using means that shall ensure that each variety [treatment] will have an equal chance of being tested on any particular plot of ground [unit] (Fisher, 1935, p. 51).”

# Randomization

# How to randomize?

* There are several processes that can be used to randomize:
  * Use a well shuffled deck of cards\.
  * Use random number generators\.
  * Use a random number table\.
  * Use software that directly randomizes into groups\.
* In each case\, however\, care should be made to ensure that the process is truly random\. __Every unit should have a known probability of being in the intervention vs\. comparison group\.__

# Deck of cards approach

Let’s say we want to randomize into two groups\, with  ½ in each group\.

Red = intervention group

Black = comparison group

Shuffle the cards well

For each unit\, choose a card\, determining which group they are in\.

Continue down the list of units\.

When one group is full\, the rest go into the other group\.

# Example (n = 10)

1\. We have 5 red cards and 5 black cards\.

2\. We shuffle the cards\.

3\. In order\, draw a card\.

_What group are these 3 in ?_

1\. We have 5 red cards and 5 black cards\.

2\. We shuffle the cards\.

3\. In order\, draw a card\.

_For the last 3\, I didn’t even need to draw the cards to know which group they were in\._

# Is this random?

“When one group is full\, the rest go into the other group\.”

Is that really random? Doesn’t this induce a dependence between the units?

Yes\, it really is independent and random\. To see why\, just imagine a different shuffling of the cards … every unit would have some the same chance being selected at the start as at the end\.

# Why does this seem not random?

Because humans aren’t very good at generating random numbers\.

For example\, which of these runs is more likely?

\#1:

\#2:

They are both equally likely\!

# Computer generated random numbers

Computer random number generators start with what is called a _seed value_ \, which is transformed in a complex way to yield the ‘random’ number\.

If you start with the same seed value\, the process always yields the same random numbers\.

# What’s so wrong with alternation?

Notice that in run \#1\, the red and blacks alternated in a pattern\. Why not just use this approach?

Three good reasons:

You can manipulate this easily\, particularly if you know that there are some units you’d like to be in the intervention group\.

It’s not actually random … which means that the statistical properties that we need do not hold\.

If there is any sort of cyclical property to your data\, you can end up with two groups that are quite different than one another\.

# Theoretical  Objections to Randomization

# Criticisms

There are a variety of criticisms of random assignment and experiments\. These include that they:

Offer an oversimplified theory of causation\.

Are unsuited for complex organizations like schools\.

Are premature without good theory\.

Are politically infeasible\.

Despite these claims\, however\, randomized experiments have been possible in education\. In the last 20 years\, for example\, over 400 such studies have been conducted in schools in the US \(funded by IES\)\.

# Experiments often fail

Another criticism is that experiments often result in ‘null’ findings\. That is\, the effect sizes are small and often not statistically different than zero\.

But isn’t this a finding in an of itself?

\(Incidentally\, this is true in fields beyond education\. In medicine\, too\, for example\, the vast majority of new treatments are not found to be effective\.\)

# Aren’t there alternatives?

Yes\, there are alternatives available\. We will talk about two of these later this week:

Non\-equivalent control group designs

Difference—in\-difference designs

But in order to recover the causal effect\, these methods:

Require assumptions\, some of which cannot be verified

Require advanced statistical methods to be used in the analyses

Require \*more\* data than experiments

# Are they unethical?

In an experiment\, some people don’t get the intervention\. Isn’t this unethical?

To answer this\, we need to consider the risks and benefits to both participants and society\.

If the potential benefits do not outweigh the risks\, overall\, then it is essentially _never_ ethical to randomize\.

# Risks of being in an intervention

Recall that many interventions\, once evaluated\, indicate that there is \*no\* evident benefit of the intervention\.

Yet there is a cost to being in the intervention group:

Your routine is disrupted

Time you could have spent learning or doing some other practice or intervention is focused on this one

# The clinical equipoise principle states that it is ethical to randomly assign patients to a treatment or control if there is genuine uncertainty in the scientific community about whether the treatment is more effective than the control condition.

# Caveat

The concept of equipoise does not mean that there must be _no_ reason to suspect the treatment is either more or less effective than the control\.

It would make no sense to evaluate a treatment if there were no reason to think it might be effective\.

There is little evidence from field trials to support the effectiveness of a treatment that is undergoing an initial field trial\.

# Complex Randomization

# Randomization can be complex

* When you think of randomization\, you likely think:
  * Every unit in the study has to be randomized
  * Every unit has to have an equal chance of being in the intervention or comparison groups
  * Randomization occurs once \(at the beginning of the study\)
* None of these rules is required though\!
* The only requirements:
  * We know which units were randomized
  * Units that are randomized have a known probability \(0 < p < 1\) of being in either group

# Complexities are your friend

Being flexible with the design can make it more palatable to potential participants\.

It can help you frame the study and the study design\.

For example\, since studies do not involve unlimited resources\, it is simply \*not\* possible for every unit interested to receive the intervention\.

This means that a lottery \(randomization\) is a \*fair\* way to allocate resources\.

# Restricted randomization

In an evaluation\, \*not\* all units have to be randomized\.  The question of what units to randomize relates not to internal validity but to _external validity_ \.

It may be beneficial to only randomize units to the intervention within a subset of the sample\. For example\,

You might choose to exclude some students in order to reduce variation on the pretest\.

There are certain students or teachers that you know you would like to _guarantee_ are included in the intervention group \(we call these ‘wildcards’\)\.

In either case\, the units that are not randomized __do not end up in the analytical sample for the analysis__ \. But they do end up in the study\.

# Unequal probabilities

There is no requirement that every unit have an equal probability of being in the intervention or comparison groups\.

It may be more feasible \(in terms of money or political capital\) to have unequal groups\, e\.g\.\, 2:1 or 1:2 instead of 1:1\.

Again\, the key is to know what these probabilities are and to incorporate them into the analysis\.

# Everyone eventually gets the intervention

There is also no rule that everyone has to stick to their assigned group forever\.

Instead\, it may be better to eventually provide the intervention to everyone\, while randomizing the order in which they receive it\.

Those that are randomized to receive it later serve as the comparison group at first\.

\(Often referred to as a ‘delayed treatment’ design\)\.

# Every unit gets some of the intervention

Another approach\, useful in clustered settings \(like schools\)\, is to guarantee that \*some\* units within the cluster will get the intervention\.

For example\, in a school:

You might randomize different grade levels to receive the program

You might only include 2ndgrade in the study \(randomizing groups\)\, but then provide the curriculum to everyone in the other grades

# But you have to explain it

When you recruit schools \(& teachers & students\) to be part of an evaluation\, you have to get their __informed consent__ \.

This includes their consent to be randomized\. Obtaining this consent requires that they understand:

That any of the schools \(including theirs\) could be in the intervention or comparison

That all of their ”best” schools \(or teachers …\) could end up in the comparison condition

# Overview of 4 Designs

RE = recruited\, RA = randomized\, O = observed/outcome\, M = measured

