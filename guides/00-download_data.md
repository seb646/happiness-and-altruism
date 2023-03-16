# Download Data from the NORC's General Social Survey (GSS)

## Step 1: Create an account
The first step in downloading data from GSS is to [create an account](https://gssdataexplorer.norc.org/user/sign_up/). 

## Step 2: Add data sets to "Extracts"
Navigate to the following data sets using your browser: 
- [General Happiness](https://gssdataexplorer.norc.org/variables/434/vshow)
- [Has Given Directions to a Stranger](https://gssdataexplorer.norc.org/variables/2886/vshow)
- [Has Given Food or Money to a Homeless Person](https://gssdataexplorer.norc.org/variables/2878/vshow)

For each data set, click the "Add to Extract" button on the right-hand side of the data set's header. 

## Step 3: Create extract
Once all three data sets have been added to your extracts list, click the "+ Extracts" bar on the top-right cornder of your screen (below the navigation bar). Once this area reveals itself, click the "Create Extract" button. 

## Step 4: Name extract
The first step in creating an extract is naming the extracted data. This step has no bearing on the data downloaded, but it is important to help you remember what data you're downloading. For the purposes of this tutorial, we'll use "Happiness and Altruism". 

## Step 5: Build extract
This is the most important step of the tutorial as it determines what variables are downloaded. Begin by selecting the "Remove All" option to the right of "Choose Variables" to begin with a clean slate. Then select the options "year", "ballot", "givhmlss", "directns", and "happy". Once each of these are selected, drag and drop to the top left area (make sure they're in "Choose Variables"and not "Case Selection"). 

## Step 6: Set extract output options
Setting options for the data is also important, as we only want to use certain years for this analysis. Select 2002, 2004, 2012, and 2014. Once you've inluded these and only these years, select "R Script" as the file format. 

## Step 7: Download extract
Once you click "Create Extract", the name of your new extract will appear in the queue. To refresh the status of the created extract, use the refresh button. Refreshing the page will take you to a different tab within these settings but will not cause you to lose any progress.

Once the extract moves to your "Completed" area, click on the "Actions" dropdown and then click the "Download" option. 

## Step 8: Get and move extract files 
The downloaded `.zip` file will give you a folder named "Final" with another compressed file within it. Extract this compressed file and a `batch_0` folder will appear. In `batch_0/result` are 4 files, but we only need `GSS.dct` and `GSS.dat`. Move the `GSS.dct` and `GSS.dat` files from this folder into this directory's `inputs/data/raw` folder and proceed to converting the data.