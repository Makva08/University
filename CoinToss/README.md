I wrote a Matlab code that gave experimental and theoretical histograms. 
For this, I randomly created a matrix 2500 by 4 and assigned each item with heads or tails, 1 or 0 respectively. 
Then I utilized for and while loops to implement my algorithm and store number of heads into different variables. 
Then I took these variables and graphed their histograms. 

In the process I also calculated theoretical values for everything that would be produced during experiments. 
There are only two outcomes of a single coin toss and the probability of each outcome is 0.5. Each new coin toss is independent of the others. 

Part 1: 
This distribution is binomial because the trials are independent, each trial has only 2 outcomes: 
“success” and “failure”, and probability of success in each trial remains constant. Let’s define Xas the random variable for this distribution of heads. 

This wat I have projected frequencies. 
Then I put these frequencies into the matrix and created another matrix with 156 0s, 625 1s, etc. Finally, I plotted required histograms.

Part 2: 
This is geometric distribution because the random variable X equals to the number of trials until the first “success” is met. In this case the “success” will be tails that terminates the “run” of heads. Therefore, for the random variable X, the formula = 10000 * 0.5x * 0.5.  Normally it would be 0.5x+1; however, here X denotes the number of heads, while in the definition for a geometric distribution, X denotes the number of trials until the first “success” (tails) happens. 
So the formula becomes 10000 * 0.5x+1.

Then, I put these values into the matrix and plotted histograms. 
