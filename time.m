function [hours, minutes] = time()
%% INITIALIZATION
hours = -1; %intialise hour to an invalid number so that while loop will run
minutes = 60; %intialise minute to an invalid number so that while loop will run 

%% FORMATTED TEXT & FIGURE DISPLAYS
disp('What time would you like the taxi to reach you? Please use 24-hour time.'); 
while (hours < 0 || hours > 23) %I used a while loop so that the user could input as many times as needed and an error wouldn't prevent the program from running
    hours = input('Hour: '); %request user to input the hour for the taxi 
    if (hours > 23)
        fprintf("Error: Greatest hour you can request is 23\n"); %error message if they request an hour greater than 23
    elseif (hours < 0)
        fprintf("Error: Smallest hour you can request is 0\n"); %error message if they request an hour less than 0 
    end %end the if structure
end %end the while loop 
while (minutes < 0 || minutes > 59) %I used a while loop so that the user could input as many times as needed and an error wouldn't prevent the program from running
    minutes = input('Minutes: '); %request user to input the minute for the taxi
    if (minutes > 59) 
        fprintf("Error: Greatest minute you can request is 59\n"); %error message if they request a minute greater than 50
    elseif (minutes < 0)
        fprintf("Error: Smallest minute you can request is 0\n"); %error messsage if they request minute less than 0
    end %end the if construct 
end %end the while loop 
end %end the function 