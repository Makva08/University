%%PART 1

tosses = randi(2,2500,4) - 1;
adder = zeros (1, 2500);
adder_2 = zeros (1, 2500);
k=1;
while k <= 2500
   adder(1,k)  = sum (tosses(k,:));
   k=k+1;
end

freq_theo = [156 625 937 625 156];
x=1;
y=1;
z=1;
while y <= 5
   z=1;
  while z <= freq_theo(1,y)
  adder_2(1,x) = y-1;
  x=x+1; 
  z=z+1;
  end
  y=y+1;
end

figure;histogram(adder);                             
xlabel("Heads in rows");
ylabel("Frequency - Experimental");

figure;histogram(adder_2);                             
xlabel("Heads in rows");
ylabel("Frequency - Theoretic");

figure;histogram(adder,"Normalization","pdf");                              
xlabel("Heads in rows");
ylabel("Relative Frequency - Experimental");

figure;histogram(adder_2,"Normalization","pdf");                              
xlabel("Heads in rows");
ylabel("Relative Frequency - Theoretic");

figure;histogram(adder,"Normalization","cdf");                              
xlabel("Heads in rows");
ylabel("Cumulative Frequency - Experimental");

figure;histogram(adder_2,"Normalization","cdf");                              
xlabel("Heads in rows");
ylabel("Cumulative Frequency - Theoretic");





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%PART 2

col = 1;
i = 0;

while col <= 4
row = 1; 
while row <= 2500
current = tosses(row, col);
length = 0;
while tosses(row ,col) == current
length = length+1;
row = row+1;
if row == 2501
break
end
end
i = i+1;
adder_3(1, i) = length;
end
col=col+1;
end

freq_theo = [2500 1250 625 313 156 78 39 20 10 5 3 2];
col=1;
i=1;
while i <= 12
for k = 1: freq_theo (1,i)
adder_4(1,col) = i;
col=col+1; 
end
i = i+1;
end

figure;histogram(adder_3); 
xlabel("Consecutive Heads"); 
ylabel("Frequency - Experimental");

figure;histogram(adder_4); 
xlabel("Consecutive Heads");
ylabel("Frequency - Theoretical");

figure;histogram(adder_3,"Normalization","pdf") 
xlabel("Consecutive Heads");
ylabel("Relative Frequency - Experimental");

figure;histogram(adder_4,"Normalization","pdf"); 
xlabel("Consecutive Heads");
ylabel("Relative Frequency - Theoretic");

figure;histogram(adder_3,"Normalization","cdf"); 
xlabel("Consecutive Heads");
ylabel("Cumulative Frequency - Experimental");

figure;histogram(adder_4,"Normalization","cdf"); 
xlabel("Consecutive Heads");
ylabel("Cumulative Frequency - Theoretic");


