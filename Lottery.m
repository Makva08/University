%%1st PART
max = 25;
num = 6;
i = 1;
m_ticket = input('Please, choose a ticket ');

while i <= 2000000
    w_ticket = datasample(1:max,num,'Replace',false);   %generating ticket by sampling without replacement
    k = 1;
    l = 1;
    same = 0;
    
    while k <= 6
        l = 1;
        while l <= 6
            if m_ticket(1, k) == w_ticket(1, l)
                same = same+1;  %checking is the numbers are the same
            end
            l = l+1;    
        end
        k = k+1;    
    end
    
    coincidences_matrix(1, i) = same;
    i = i+1;
end

number_0 = 1/nchoosek(max,num) * 2000000;                                               %jackpot
number_1 = nchoosek(num, num-1)*nchoosek(max-num, 1)/nchoosek(max,num) *2000000;    
%5 numbers conicide
number_2 = nchoosek(num, num-2)*nchoosek(max-num, 2)/nchoosek(max,num) *2000000;    
%4 numbers conicide
number_3 = nchoosek(num, num-3)*nchoosek(max-num, 3)/nchoosek(max,num) *2000000;    
%3 numbers conicide
number_4 = nchoosek(num, num-4)*nchoosek(max-num, 4)/nchoosek(max,num) *2000000;    
%2 numbers conicide
number_5 = nchoosek(num, num-5)*nchoosek(max-num, 5)/nchoosek(max,num) *2000000;   
%1 numbers conicide
number_6 = nchoosek(num, num-6)*nchoosek(max-num, 6)/nchoosek(max,num) *2000000;    
%0 numbers conicide

occurences = [number_0; number_1; number_2; number_3; number_4; number_5; number_6];
q = 1;
index = 1;
while q <= num+1
    for p = 1:occurences(q)
        coincidences_theo(1,index) = num-q+1;
        index = index +1;
    end
    q= q+1;
end

figure;histogram(coincidences_matrix);
xlabel("Coincidences");
ylabel("x");

figure;histogram(coincidences_theo);
xlabel("Coincidences");
ylabel("Frequency - Theoretical");

figure;histogram(coincidences_matrix,"Normalization","pdf")                              
xlabel("Coincidences");
ylabel("Relative Frequency - Experimental ");

figure;histogram(coincidences_theo,"Normalization","pdf")                              
xlabel("Coincidences");
ylabel("Relative Frequency - Theoretical ");

figure;histogram(coincidences_matrix,"Normalization","cdf")                              
xlabel("Coincidences");
ylabel("Cumulative Frequency - Experimental ");

figure;histogram(coincidences_theo,"Normalization","cdf") 
xlabel("Coincidences");
ylabel("Cumulative Frequency - Theoretical ");

3) Histograms


 


%%2nd PART
max = 30;                   %numbers to choose from
num = 6;                    %how many numbers to choose
n_players = 1000000;         %total number of players
dif_price = 0;              %how much more should actual ticket cost than a min prince required to have some revenue
price = 20;
jacks = 0;
weeks = 0;
revenues_sum =0;
losses =0;

[weekly_revenue, weekly_loss, min_price, jacks] = wk(max, num, n_players, price);

function [weekly_revenue, weekly_loss, min_price, jacks] = wk(max, num, n_players, price)
i = 1;
w_ticket = datasample(1:max, num, 'Replace', false);
for i = 1:num+1
    m_same (1, i) = 0;
end

while i <= n_players
    m_ticket = datasample(1:max, num, 'Replace', false);
    same = 0;
    for k = 1:num
        for l = 1:num
            if m_ticket(1, k) == w_ticket(1, l) 
                same = same+1;                                    
            end
        end
    end
    coincidences_matrix(1, i) = same;
    m_same (1, same+1) = m_same (1, same+1) + 1;    %how many cases for each winning category
    i = i+1;
end

x = ['Jackpots: ', num2str(m_same(1, num+1))];                   disp (x);
for i = 1:num
    x = [num2str(num-i), ' same numbers: ', num2str(m_same(1, num-i+1))];         disp (x);
end

v_prize = [1000000 10000 1000 100];

out_money = 0;
for i = 1:num-2
out_money = out_money + v_prize (1, i) * m_same (1, num-i+2); 
end

min_price = out_money / n_players;
dif_price = price - min_price;

if dif_price > 0
weekly_revenue = dif_price * n_players;
weekly_loss = 0;
else weekly_loss = - (dif_price * n_players);
weekly_revenue = 0;
end 
jacks = m_same(1, num+1);

figure;histogram(coincidences_matrix);
xlabel("Same numbers");
ylabel("Frequency - Experimental");

figure;histogram(coincidences_matrix, "Normalization","pdf") 
xlabel("Same numbers");
ylabel("Relative Frequency - Experimental");

figure;histogram(coincidences_matrix, "Normalization","cdf") 
xlabel("Same numbers");
ylabel("Cumulative Frequency - Experimental");

end





%This piece should be added before the function to get results for more weeks

while (weeks < 10)
   [weekly_revenue, weekly_loss, min_price, jacks] = wk(max, num, n_players, price);
   weeks = weeks + 1;
   revenues_sum = revenues_sum + weekly_revenue;
   losses = losses + weekly_loss;
end 

