# Part 1
data(ToothGrowth)
toothgrowth <- transform(ToothGrowth, supp = factor(supp))
summary(toothgrow) # not great...
boxplot(len ~ dose * supp,
        toothgrowth,
        col  = "lightblue",
        main = "Basic Exploratory
Analyses",
        xlab = "Dose and Supplement",
        ylab = "Tooth length") # much better!

# Part 2
# =======
# From the cran repository, we know that this dataset represents the response length in odontoblasts
# (teeth) for 10 guinea pigs with respect to a dosage level of Vitamin C through two delivery methods.
# Vitamin C was administersed at three dose levels of 0.5, 1, and 2 mg with two delivery methods,
# orange juice and ascorbic acid.

# From our exploratory analysis, we can see that there is a positive correlation between tooth length
# and dose of supplement for both delivery methods. Orange juice seems to be more effective at lower
# doses, while both methods center around the same tooth length at higher doses. In addition, we can
# also see that ascorbic acid has greater variance at higher dose levels.

# Part 3
# =======
# Hypothesis test:
# Ho = lenOJ == lenVC // no difference in length between the two treatments.
# Ha = lenOJ != lenVC //    difference in length between the two treatments.

# performing a two-sided t-test:
t.test(len ~ supp, data = toothgrowth)

# yeilds a 95% confidence interval around [-0.171, 7.571], with a p-value of 0.06063.
# in this scenario, we would not reject this null hypothesis. Note, however, that
# a slight decrease in confidence - of 90% — would yield a confidence interval of
# [0.468, 6.932] in which case we would reject the null hypothesis. For the purposes
# of this study, we'll continue to accept the null but will keep this difference in
# mind for future studies.
t.test(len ~ supp, data = toothgrowth, conf.level = 0.9)
