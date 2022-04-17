My project for the course is the lottery simulation. There will be a total number, for example 50. from which a ticket will be generated. 
Ticket will consist of 6 numbers. I will use matlab function to randomly generate winning tickets enough times to get accurate results. 
Then, compare them with a ticket that I picked and record how many numbers were met. 
There will be different winning categories for cases were 1,2,3,4 or 5 numbers are met with a winning ticket. 
I will record them and then plot pdf and cdf histograms. Then, I will theoretically calculate the probability of winning each category. 
For the next part I will take a city with certain population and provide them with randomly generated tickets. 
Then compare them with a winning ticket and record how many jackpots and other categories were won. 
Also, I will select winning prizes and based on the experiment determine how much money will be awarded. 
Based on that I will determine the minimum price for a ticket that will provide a revenue for the company. 

My project is simulating lottery, recording probabilities of each outcome and plotting probability distribution functions using Matlab. 
Lottery starts by picking a ticket that consists of 6 numbers. I choose the following ticket: [2 21 7 10 18 5]. 
Then I created different winning categories, largest of which will be the jackpot. Next, I randomly generated 6 numbers out of 25 possible outcomes. 
These values should be treated as inputs and can be changed. I compared my ticket to the randomly generated ticets and stored number of coincidences in the matrix. 
I conducted this experiment 2 million times, get the probability mass and cumulative functions graphs of each winning category, and compare the results. 
I computed probabilities for each case to occur. Then, I made theoretical evaluations and compared them to experimental results. 

Theoretical evaluations: 
Cxnum * C6-xmax-num / C6max
Here num and mux are adjustable values and give different results. 
In my experiment I chose them to be 6 and 25. This way I got probabilities, multiplied them by the number of trials and put the results into a matrix. 
Matrix contains number of coincidences for each trial. I plotted histograms.


2nd part:
I have created a code starts with inputs for a population that buys a lottery, maximum number that a player can choose, how many numbers should a player choose, 
and the price of the ticket. This values are adjustable which will give different results. The user will be able to see the revenue and loss changes if any 
of those inputs are changed and draw conclusions from it.
I created a function wk that takes those values as inputs and outputs weekly revenues and losses as results, also the minimum price that ticket must cost to reach revenue for that particular lottery day. 
In a week there is one lottery day. Inside the function I randomly generated a winning ticket for this day, as well as “num” numbers of tickets that are bought by players. 
In loops are compared those tickets and created two matrices: one that stores every number of coincidences with the winning ticket for each ticket, and the second that counts those number of coincidences. 
I graphed the matrix that showed number of coincidenses and its frequencies, relative frequencies, and cumulative frequencies. 
Then, using a loop and disp(x) function I put those counts to the screen. Then comes another component thar could be changed: the prize categories. 
I created variable ‘out_money’ that counts how much money will be spend on paying their customers according to winning categories. 
Money prize is not split between the same ticketholders. By dividing this number by total number of players, I got the minimum price that a ticket should cost in order to avoid financial losses. Then I calculate the difference between this value of minimum price and the actual price that we chose in the beginning. This might be negative, if the actual price is less, and in that case weekly_loss is calculated, otherwise weekly_revenue. 
Also, to give more options I added a while loop that can be set to run for a year (52 weeks) or until a jackpot is reached or some other condition. 
This loop calls aforementioned function many times and sums revenues and losses. This way we can see revenues for a year or more. However this will take a lot of time.

