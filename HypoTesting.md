# Hypothesis Testing


## Hypothesis testing

is a method of statistical inference. An alternative hypothesis is proposed for the probability distribution of the data, either explicitly or only informally. The comparison of the two models is deemed statistically significant if, according to a threshold probability—the significance level—the data would be unlikely to occur if the null hypothesis were true. [Ref](https://en.wikipedia.org/wiki/Statistical_hypothesis_testing)

### Step to do:
🐈🐎🐑🐱🐯🐏🐖🐄🐃🐂 <br>
0. Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion



### Find Number of Countries (n)

- Finding Number of Countries

```
#Finding Number of Countries
n <- happiness %>% count() %>% pull();
n

```
// 156


### Find Mean (x̄)

- Finding average score of happiness

```
#Finding average score of happiness
mean <- mean(happiness$Score,na.rm = T);
sprintf("%.2f",mean)

```
// 5.41

### Find Standard Deviation (sd, σ)

- Finding Standard Deviation of happiness

```
#Finding Standard Deviation of happiness
sd <- sd(happiness$Score,na.rm = T);
sprintf("%.2f",sd)

```
// 1.11


### Example 1

The Gallup World Poll has surveyed data about happiness score from a sample of 156 countries. The  happiness mean score should be at least 5 and accept 0.01 for the risk. The average score of happiness from survey in Gallup World Poll is 5.41 and standard deviation is 1.11. Is that score low enough to reject H0?

Step 0: Assign variables

```
n <- 156
sd <- 1.11
xbar <- 5.41
u0 <- 5

```

Step 1: State the hypothesis

```
#h0: u<=5   ,ha: u>5

```

Step 2: Level of significance

```
alpha <- 0.01 

```

Step 3: Test statistic

```
t <- (xbar - u0) / (sd/sqrt(n));
t

```
// 4.613422

Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- pt(t,n-1,lower.tail = FALSE);
pvalue

# Critical Value approach
talpha <- qt(alpha,n-1,lower.tail = FALSE);
talpha

```
// P-value = 4.122492e-06 ,Critical value = 2.350646

Step 5: Compare

```
# Using p-value approach
if(pvalue<alpha){
  print("Reject H0")
}else{
  print("No Reject H0")
}

# Using critical value
if(t>talpha){
  print("Reject H0")
}else{
  print("No Reject H0")
}

```
// P-value = "Reject H0" ,Critical value = "Reject H0"

Step 6: Conclusion

The average happiness score from survey in Gallup World Poll is low enough to reject H0.


🐈🐎🐑🐱🐯🐏🐖🐄🐃🐂


### Find Number of Countries (n)

- Finding Number of Countries

```
#Finding Number of Countries
n <- happiness %>% count() %>% pull();
n

```
// 156


### Find Mean (x̄)

- Finding average score of happiness

```
#Finding average score of happiness
mean <- mean(happiness$TrustGov,na.rm = T);
sprintf("%.2f",mean)

```
// 0.11

### Find Standard Deviation (sd, σ)

- Finding Standard Deviation of happiness

```
#Finding Standard Deviation of happiness
sd <- sd(happiness$TrustGov,na.rm = T);
sprintf("%.2f",sd)

```
// 0.094

### Example 2

The Gallup World Poll has surveyed data about Trust Government from a sample of 156 countries. The average trust government score should be equal or greater than 0.2 and accept 0.05 for the risk. The average score of trust government from Gallup World Poll is 0.11 and standard deviation is 0.09. Is that score low enough to reject H0?

Step 0: Assign variables

```
n <- 156
sd <- 0.094
xbar <- 0.11
u0 <- 0.2

```

Step 1: State the hypothesis

```
#Ho >= 0.2 , Ha <0.2 

```

Step 2: Level of significance

```
alpha <- 0.05

```

Step 3: Test statistic

```
z <- (xbar - u0) / (sd/sqrt(n));
z

```
// -11.81

Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- pnorm(z); 
pvalue

# Critical Value approach
zalpha <- qnorm(alpha);
zalpha

```
// P-value = 1.715 ,Critical value = -1.644

Step 5: Compare

```
# Using p-value approach
if(pvalue<=alpha){
  print("Reject Ho")
}else{
  print("No Reject Ho")
}

# Using critical value
if(z<=zalpha){
  print("Reject Ho")
}else{
  print("No Reject Ho")
}

```
// P-value = "Reject Ho" ,Critical value = "Reject Ho"

Step 6: Conclusion

The average score of trust government from Gallup World Poll is low enough to reject H0.
