function [inp] = now_or_later()
%% INITIALIZATION
a = 3; %initalise value of a to invalid number so that while loop will iterate at least once 

%% FORMATTED TEXT & FIGURE DISPLAYS
while a ~= [0,1] %while loop so that user can input as many times as necessary 
inp = input('Would you like a taxi now or later? Enter 1 if you would like a taxi now, enter 0 if you would like a taxi later: '); %request user input to decide whether they want a taxi now or later
a = inp; %update the value of a so that the while loop test expression will be evaluated again
if inp ~= [0,1] 
    fprintf("\nError: Please enter either 0 or 1\n") %display error message if user inputs anything other than 0 or 1 
end %end the if structure
end %end the while loop
end %end the user defined structure 

