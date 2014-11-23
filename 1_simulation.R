# Set up
set.seed(7)
n             <-   40
lambda        <-  0.2
nsimultations <- 1000

simulation    <- replicate(n = nsimultations,
                           expr = rexp(n,lambda))
# Part 1
mean(simulation)
# Part 2
sd(simulation)
# Part 3
hist(simulation)
hist(colMeans(simulation))
