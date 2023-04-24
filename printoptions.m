function [options] = printoptions(free, options, rows_in_options, now_or_later, hours, minutes)         
%% INITIALIZATION
disp("What would you like to prioritise?");
priority = 2; %initialise priority to invaild number 

%% CALCULATIONS
while priority ~= [0,1] %while loop so that user can continue to input as many times as necessary 
priority = input("Enter 0 if you would like to prioritise driver rating. Enter 1 if you would like to prioritise driver's distance from you: "); %request user to input priority 
    if priority ~= [0,1]
        fprintf("Error: Please enter either a 0 or 1\n"); %error if the user types anything other than 0 or 1
    end %end if structure 
end %end while loop 
for i = 1:rows_in_options
    options(i,1) = i; %serial number for the driver 
end
for row = 1:rows_in_options
    for col = 1:2 %traverse the rows and columns of the matrices 
        options(row,col+1) = round(free(row,col), 2); %put nonzero values into options matrix
    end %end inner for loop 
end %end outer for loop 

%% FORMATTED TEXT & FIGURE DISPLAYS
if priority == 0 %if they prioritise driver rating 
    ratings = options(:,2); 
    maxrating = max(ratings); %find the maximum rating of all available drivers 
    dimensions_1 = find(options(:,2) == maxrating); %find the index in the options matrix where the rating of the driver is the maximum rating 
    row_1 = dimensions_1(1); %find the row of the index
    if now_or_later == 1
        fprintf("\nYour Driver has a rating of %.2f. Your Driver is %.2f miles away from your location.\n", options(row_1,2), options(row_1,3)); %print message of driver information 
    elseif now_or_later == 0
        fprintf("\nYour Driver will arrive at %d:%d. Your Driver has a rating of %.2f. Your Driver is %.2f miles away from your location.\n", hours, minutes,  options(row_1,2), options(row_1,3));%print message of driver information
    end %end the inner if structure
elseif priority == 1 %if they would like to prioritise driver's distance from user 
    distance = options(:,3); 
    mindistance = min(distance); %find the driver closest to user 
    dimensions_2 = find(options(:,3) == mindistance); %find the index in the options matrix where the distance of the driver is the minimum distance
    row_2 = dimensions_2(1); %find the row of the index 
    if now_or_later == 1    
        fprintf("\nYour Driver has a rating of %.2f. Your Driver is %.2f miles away from your location.\n", options(row_2,2), options(row_2,3)); %print message for driver information 
    elseif now_or_later == 0
        fprintf("\nYour Driver will arrive at %d:%d. Your Driver has a rating of %.2f. Your Driver is %.2f miles away from your location.\n", hours, minutes, options(row_2,2), options(row_2,3)); %print message for driver information 
    end
end %end the if structure 
end %end the function
