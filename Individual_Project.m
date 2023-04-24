%% INITIALIZATION
now_or_later = now_or_later(); %This function asks the user to input whether they want a taxi now or later. This function is 10 lines
if now_or_later == 0
    [hours, minutes] = time(); %This function asks the user to input the time they want the taxi if they want it later. This function is 21 lines. 
end %end the if structure 
largest = 5; %This is the maximum rating a driver can have 
data = zeros(10, 3);%This array will store the initial data for all 10 drivers
num_gen = 0; %This is the total number of ratings generated
index = 1;  %Index of element in the array

%% CALCULATIONS
while num_gen < 10
    gen_rating = rand()*5; %The rand() function generates a number between 0 and 1. I multiplied it by 5 to make sure I get ratings between 0 and 5
    num_gen = num_gen + 1; %Increment num_gen so that the program will recognize that another number has been generated
    data(index) = gen_rating; %Inputting the genrated ratings into the array 
    index = index + 1; %increment index by 1 
end %end the while loop 
for i = 1:10
    data(i) = round(data(i),2); %round all of the numbers in the array to 2 decimal places
end %end the for loop 
for k = 11:20 
gen_busy = rand(); %generate a random number between 0 and 1
gen_busy = round(gen_busy); %round to the nearest integer to generate either 0s or 1s
data(k) = gen_busy; %The second column will now be filled with either 0s or 1s to determine whether or not a particular driver is busy
end %end the for loop 
for a = 1:10
    gen_distance = rand() * 10; %randomly generate the driver's distance from the user
    gen_distance = round(gen_distance, 2);
    data(a,3) = gen_distance; %input the distance into the matrix 
end  %end the for loop 
free = zeros(10,2); %create an array for the free drivers 
l = 1; %intialise a counter for the number of free drivers
for j = 1:10 
    if data(j,2) == 1
        free(l,1) = data(j,1); %add the ratings of the free drivers to the 'free' array 
        free(l,2) = data(j,3); %add the distance of the free drivers to the 'free' array 
        l = l + 1; %increment the index 
    end %end the if structure
end %end the for loop
zero = find(~free); %Index of elements in free that are zeros 
first_zero = zero(1); %First element which is a zero 
rows_in_options = first_zero - 1; %Number of rows in options (matrix excluding the zeros)
options = zeros(rows_in_options, 3); %new matrix for options available to user 
final_matrix = printoptions(free, options, rows_in_options, now_or_later, hours, minutes); %call the function to print the options 

%% OUTPUTS
validation = input("\nAre you satisfied with your driver? Enter 1 if yes, enter 0 if no: "); %check if the user is satisfied with this driver 
if validation == 1
    fprintf("\nHave a great day!\n"); %end the program with a closing satement if they are satisfied 
else %if user is not satisfied with driver selection 
    fprintf("\nBelow is the data for all available drivers:"); %let the user know that the avaiable drivers will be displayed below
    fprintf("\nDriver Number Rating   Distance\n") %titles for columns 
    disp(final_matrix) %display the matrix with information of available drivers 
    number = input("\nPlease select the driver number you would like: "); %tell the user to select which driver they would like 
    if now_or_later == 1
        fprintf("\nYour new driver has a rating of %.2f. Your new driver is %.2f miles away from your location.", final_matrix(number, 2), final_matrix(number, 3)); %display the information for the new driver without time if user wanted a taxi now
    else
        fprintf("\nYour new driver will arrive at %d:%d. Your new driver has a rating of %.2f. Your new driver is %.2f miles away from your location.\n", hours, minutes, final_matrix(number, 2), final_matrix(number, 3)); %display information with time if user wanted a taxi later 
    end %end the inner if construct     
    fprintf("\nHave a great day!\n"); %closing statement to finish the program
end %end the if construct
