# Rideshare_App

## **Introduction**

The theme of this project is a taxi system, similar to those used by companies such as UberandLyft. The program I have created assigns a taxi to the user of the program. When run, the program asks the user a series of questions and, depending on the user’s answers, assigns the user a taxi driver. 

I selected this topic because I have always wanted to know how apps like Uber and Lyft work so I decided to try to make a program similar to these apps myself. I knew that I would learn a lot by trying to learn something new myself rather than only researching so I saw this project as the perfect opportunity to understand how these popular apps actually assign drivers to the user.

## **Program Overview**
This program will assign a taxi driver to the user, using information from numerous inputs from the user. When the program is first run, the now_or_later function is called. This function prompts the user to input whether they would like a taxi now or later. If the user inputs invalid information, an error message is displayed and the user is prompted to answer again. The user can input as many times as necessary until they input valid information. If the user would like a taxi later, the time function is called. This function prompts the user to input what time they would like the taxi to reach them. Error messages are displayed if they input invalid values for time, and the user is prompted to enter the time again. If the user wants the taxi now, this function is not called. Next, the program uses a random number generator to generate values for driver rating between 0 and 5, each of which is then rounded to 2 decimal places.

The program then generates a random number between 0 and 10 for the driver’s distance from the user, which is then also rounded to 2 decimal places. Both driver rating and driver distance values are generated 10 times (as I have assumed a total of 10 drivers). To determine whether a driver is busy, the program randomly generates a 0 or 1 for each driver. If a 1 is generated, the driver is considered available for a ride and this driver can be assigned to a user. If a 0 is generated, the driver is considered busy and cannot currently be assigned to a user. Data for all free drivers is then stored in a new matrix (called “free”). The matrix “free” is then checked for any rows with all 0s, and these rows are removed and the data is then stored in another matrix called “options” which can later become visible to the user (if they would like to see all options for which drivers are available).

The printoptions function is then called. If the user wants to prioritise driver rating, this function finds the highest driver rating of all available ratings, assigns this driver to the user, and prints the driver’s information (i.e. the driver’s rating and distance from the user). If the user wants to prioritise driver distance, this function finds the driver who is closest to the user, assigns this driver to the user, and prints the driver’s information. If the user wanted a taxi for later, the time at which they wanted the taxi will also be displayed. This function returns the matrix of all available drivers with the driver’s ratings and distance (which the user will be able to see if necessary).

Finally, the program asks the user if they are satisfied with the driver that has been assigned to them. If they are satisfied, the program prints an exit message and the program is terminated. If the user is not satisfied, the program shows the user all available drivers and the user can then select whichever driver they would like. This is helpful if, for example, the user would like a driver with a reasonably high rating but is not too far away from them. After the user selects the driver they would like, the new driver information is displayed, an exit message is printed, and the program terminates.

## **Description of User Defined Functions**
### 1) now_or_later

This function is called to ask the user whether they would like a taxi now or if they would like to schedule for later. Since this is a user input, I have written the code such that the user can input the information as many times as necessary until they input valid information. In order to do this, I have initialised a variable “a” to 3 which is an invalid value for input so that the while loop runs at least once because the condition for the while loop is a~= [0,1]. When the while loop runs, the user is prompted to enter the value 1 if they would like a taxi now and 0 if they would like a taxi later. This explains the condition for the while loop; if the user enters anything other than 0 or 1, an error message is displayed and the while loop runs again so they are prompted to enter 0 or 1 again. This function takes no input arguments and outputs a 0 or 1 (depending on the user input).

### 2) time

This function is called only if the user wants a taxi at a later time. When this function is called, the user is prompted to input the time at which they would like a taxi. First, they are asked to enter the hour they would like the taxi. Then, they are asked to enter the minute at which they would like a taxi. If the user inputs an hour greater than 24 or less than 0, an error message is displayed and (using a similar method to the now_or_later function), they are prompted to input the values again. This function takes no input arguments and outputs the hour and minutes (inputted by the user).

### 3) printoptions

This function is called to print the driver information. First the user is asked whether they would like to prioritise driver rating or the driver’s distance from the user. If they would like to prioritise driver rating, they are asked to enter 0. They are asked to enter 1 if they would like to prioritise the driver’s distance from the user. If the user enters anything other than 0 or 1, they are asked to enter the values again and (using a similar method to the now_or_later function) they can do this as many times as necessary until they enter valid information. Below is a table explaining the input argumants for the function. 


|**Input Argument** | **Explanation** |
| :----: | :----: |
| free | Matrix containing data for all free drivers | 
| options | Empty matrix which will contain final information of all available drivers (including the serial number) which the user will see if they want to select a driver themselves |
| rows_in_options | Number of rows in the options matrix | 
| now_or_later | Value indicating whether user would like the taxi now or later | 
| hours | Hour at which the user would like a taxi (if they chose to schedule a taxi for later) | 
| minutes | Minute at which the user would like a taxi (if they chose to schedule a taxi for later) | 

Next, the function uses a for loop to enter the serial numbers of the drivers in the first column of the options matrix. After this for loop is ended, the function uses a nested for loop to import the data for driver ratings and driver distances from the free matrix into the options matrix.

If the user chose to prioritise driver rating, the function finds the driver with the highest rating and assigns this driver to the user. If the user chose to prioritise driver distance, the function finds the driver with the least distance from the user and assigns the driver to the user. If the user wants a taxi now, the driver information is displayed (i.e. the driver’s rating and their distance from the user). If the user wants a taxi later, the function also displays the time at which the driver will arrive. The function returns the modified options matrix.
