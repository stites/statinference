# Set up
set.seed(7)
n             <-   40
lambda        <-  0.2
nsimulations  <- 1000

simulation    <- replicate(n = nsimulations,
                           expr = rexp(n,lambda))
# Part 1
mean(simulation)
# Part 2
sd(simulation)
# Part 3
means <- colMeans(simulation)
makeHist<-function(data, title){
  hist(data,
       freq=FALSE,
       col = "light blue",
       breaks=20,
       main=title)
  lines(density(data), col = "red")
}
makeHist(means,      "Dist. of large collection of means for 40 exponentials")
makeHist(simulation, "Dist. of a large collection of random exponentials")
# Q-Q plots
# compare means to normal distribution
qqnorm(means,
       col = "blue",
       main="theoretical normal QQ");
qqline(means, col = "red")
# compare simulations to the exponential distributions
qqplot(rexp(1000, rate=lambda),
       simulation,
       col = "blue",
       main="theoretical exponential QQ")
abline(0,1, col = "red")
